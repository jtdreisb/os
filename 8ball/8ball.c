#include "../drivers.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


/*
 * Function prototypes for the hello driver.
 */
#define NUM_ANSW 20
/* 8Ball responses */
char *answ[NUM_ANSW] = {
		"Signs point to yes.\n",
		"Yes.\n",
		"Reply hazy, try again.\n",
		"Without a doubt.\n",
		"My sources say no.\n",
		"As I see it, yes.\n",
		"You may rely on it.\n",
		"Concentrate and ask again.\n",
		"Outlook not so good.\n",
		"It is decidedly so.\n",
		"Better not tell you now.\n",
		"Very doubtful.\n",
		"Yes--definitely.\n",
		"It is certain.\n",
		"Cannot predict now.\n",
		"Most likely.\n",
		"Ask again later.\n",
		"My reply is no.\n",
		"Outlook good.\n",
		"Don't count on it.\n",
};
int questions;

void init(void) 
{
	srand(time(NULL));
	questions = 0;
}
void dev_reply(message *m, int status)
{
/* Send a reply to a process that wanted to read or write data. */
  message mesg;

  mesg.m_type = TASK_REPLY;
  mesg.REP_PROC_NR = m->PROC_NR;
  mesg.REP_STATUS = status;

  if ((status = send(m->m_source, &mesg)) != OK) {
	exit(1);
	  /*panic("TTY","tty_reply failed, status\n", status);*/
  }
}

int dev_read(message *m)
{
	int r = 0;
	int qindex;

	if(questions > 0) {
		qindex =  rand() % NUM_ANSW;
		r = strlen(answ[qindex]);
		if (m->COUNT < r) {
			r = m->COUNT;
		}
		if (sys_datacopy(SELF, 
			(vir_bytes) answ[qindex],
			m->PROC_NR,
			(vir_bytes) m->ADDRESS, 
			(phys_bytes) r) != OK) {
			r = EFAULT;
		} else {
			/* we just gave it some answers */
			questions--;
		}
	}
	return r;
}

int dev_write(message *m)
{
	int r, i;
	char *buffer;
	if (m->COUNT <= 0) {
		/* no data */
		r = EINVAL;
	} else {
		buffer = malloc(m->COUNT);
		r = m->COUNT;
		if (buffer == NULL) {
			r = EFAULT;
		} else {
			if (sys_datacopy(m->PROC_NR,
					(vir_bytes)m->ADDRESS,
					SELF, 
					(vir_bytes)buffer, 
					(phys_bytes)m->COUNT)) {
				r = EFAULT;
			} else {
				/* we got good data in our stuff */
				for (i=0; i < m->COUNT; i++) {
					if (buffer[i] == '\n') {
						questions++; 
					}
				}
			}
			free(buffer);
		}
	}
	return r;
}




int dev_ioctl(message *m)
{
	return OK;
}

int dev_open(message *m)
{
	/* dont do much */
	return OK;
}

int dev_close(message *m)
{
	/* don't do much */
	return OK;
}

int dev_cancel(message *m)
{
	return OK;
}


int main(int argc, char **argv)
{
	message mess;
	int r;
	/*
	* Perform initialization.
	*/
	init();
	/*
	* Run the main loop.
	*/
	for (;;) {
		/* Get any request message. */
		r = receive(ANY, &mess);
		if (r != 0) {
			printf("8BALL\n");
			exit(1);
		}

		switch (mess.m_type) { 
		case HARD_INT: 		/* hardware interrupt notification */
			/*complain doesnt work*/
			printf("HARD INT\n");
			break;		/* contine to check for events */
		
		case SYS_SIG:	exit(0); 		break;
		
		case DEV_READ:	 r = dev_read(&mess);	break;
		case DEV_WRITE:	 r = dev_write(&mess);	break;
		case DEV_IOCTL:	 r = dev_ioctl(&mess);	break;
		case DEV_OPEN:	 r = dev_open(&mess);	break;
		case DEV_CLOSE:	 r = dev_close(&mess);	break;
		case CANCEL:	 r = dev_cancel(&mess);	break;
		default:			/* should be a driver request */
				 r = EINVAL;
			break;			/* do nothing; end switch */
		}

		dev_reply(&mess,r);
	}
	
    return OK;
}
