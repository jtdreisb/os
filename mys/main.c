/*
 * mys
 * Assignment 1
 * Jason Dreisbach
 * 3/31/11
 *
 * This is a script utility
 */ 


#include "global.h"

/*
 * mys 
 *
 * Three procs
 *  input - doesn't buffer the input from user 
 *          terminal and forwards it straight to the shell
 *  ouput - keeps a copy of all of the output from the shell
 *          and forwards it to the controlling terminal
 *  shell - duh .... this is /bin/sh
 *
 * 
 */
#define GREETING "Script started, output file is "
#define DEPART   "\nScript finished on "

int main(int argc, char ** argv) {

    int pid, status;
    int pids;
    char *outputfile = "typescript";
    /* fd of ouput file */
    int outfd;
    /* fd of the open pty  */
    int shpty;
    struct termios oldterm;
    struct winsize oldwin;
	char *tstring;
	time_t tval;
    
    /* there should be no more than 2 arguments */
    if (argc > 2) {
        fprintf(stderr, "usage:\n\tmys <typscript>\n");
        exit(1);
    } else if (argc == 2) {
        /* arg 1 should be the name of the file  */
        outputfile = argv[1];
    }

    get_winsize(STDIN_FILENO,&oldwin);
    raw_mode(STDIN_FILENO, &oldterm);

    /* start the slave process and return the fd we use to communicate with it */
    shpty = startShell(&oldterm, &oldwin);
    if (shpty == -1) {
        perror("startShell");
        restore_mode(STDIN_FILENO,&oldterm);
        exit(1);
    }
    /* start input forwarding process */
    pids = inputForward(shpty);
    if (pids == -1) {
        perror("inputforward");
        restore_mode(STDIN_FILENO,&oldterm);
        exit(1);
    }

    outfd = open(outputfile, O_WRONLY|O_CREAT|O_TRUNC, 0666);
    if (outfd == -1) {
       perror("open: typescript"); 
       restore_mode(STDIN_FILENO,&oldterm);
       exit(1);
    }
    
    /* do the ouput shoveling and archiving */
	write(outfd, GREETING, strlen(GREETING));
	write(STDOUT_FILENO, GREETING, strlen(GREETING));
	write(outfd, outputfile, strlen(outputfile));
	write(STDOUT_FILENO, outputfile, strlen(outputfile));
	write(outfd, "\n", 1);
	write(STDOUT_FILENO, "\n", 1);

    if (output_archive(shpty, outfd) == -1) {
        perror("output");
    }

	tval = time(NULL);
	tstring = ctime(&tval);
	write(outfd, DEPART, strlen(DEPART));
	write(STDOUT_FILENO, DEPART, strlen(DEPART));
    write(outfd,tstring,strlen(tstring));
	write(STDOUT_FILENO,tstring,strlen(tstring));
  /*  write(outfd,"\n",1);
	write(STDOUT_FILENO,"",1);*/

    restore_mode(STDIN_FILENO, &oldterm);


    /*kill(pids[0], SIGTERM);*/
    kill(pids, SIGTERM);
    close(outfd);
    close(shpty);
    pid = wait(&status);
    if (WIFSIGNALED(status)) {
        fprintf(stderr, "proc %d exited with status %d", pid, status);
    }

    return 0;
}

