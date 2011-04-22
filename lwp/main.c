/*
 * snake:  This is a demonstration program to investigate the viability
 *         of a curses-based assignment.
 *
 * Author: Dr. Phillip Nico
 *         Department of Computer Science
 *         California Polytechnic State University
 *         One Grand Avenue.
 *         San Luis Obispo, CA  93407  USA
 *
 * Email:  pnico@csc.calpoly.edu
 *
 * Revision History:
 *         $Log: main.c,v $
 *         Revision 1.2  2004-04-13 12:31:50-07  pnico
 *         checkpointing with listener
 *
 *         Revision 1.1  2004-04-13 09:53:55-07  pnico
 *         Initial revision
 *
 *         Revision 1.1  2004-04-13 09:52:46-07  pnico
 *         Initial revision
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "lwp.h"

#define INITIALSTACK 2048*4

typedef void (*sigfun)(int signum);
static void indentnum(void *num);

int AlwaysZero() {
  /* A scheduler that always run the first one */
  return 0;
}

int main(int argc, char *argv[]){
    int i;

/*`    lwp_set_scheduler(AlwaysZero);*/

    printf("Launching LWPS\n");
    i=6;
    if (-1 == new_lwp((lwpfun)indentnum,(void*)i,INITIALSTACK)) {
        fprintf(stderr, "problem\n");
    }

    if (-1 == new_lwp((lwpfun)indentnum,(void*)4,INITIALSTACK)) {
    } 

  lwp_start();  /*                    returns when the last lwp exits */

  printf("Back from LWPS.\n");
  return 0;
}

static void indentnum(void *num) {
    printf("HELLO BITCHES %d\n", (int) num);
    DBG("HELLO WORLD");

    DBG("num: %d", (int)num);
    lwp_yield();
    DBG("1 yield");
    lwp_yield();
    DBG("2 yield");
    lwp_exit();
    return;

}

