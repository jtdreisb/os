/* 
 * asignment 2
 * lwp.c
 */
#include "lwp.h"
#include <stdlib.h>



/* process table */
lwp_context lwp_ptable[LWP_PROC_LIMIT];
int lwp_procs   =  0;           /* the current number of LWPs  */
int lwp_running = -1;         /* the index of the currently running LWP */

schedfun lwp_sched;


/* new_lwp
 *
 * parameters:
 * (lwpfun) f - 
 * (void *) argv - 
 * (size_t) stacksize - 
 *
 * return: pid
 */
int  new_lwp(lwpfun f,void * argv,size_t stacksize) {
    lwp_context *lwp = &lwp_ptable[lwp_procs];
    /* set pid, stacksize and stack */

    lwp->pid = lwp_procs;
    lwp->stacksize = stacksize;
    lwp->stack = malloc(stacksize*sizeof(long));
    if (!lwp->stack) {
        perror("malloc: stack");
        return -1;
    }

    /* write our 0xdeadbeef to the bottom of the stack */
    lwp->stack[0] = 0xdeadbeef;

    /* put the stackpointer at the highest memory location */
    lwp->sp = lwp->stack + lwp->stacksize;

    /* everything succeeded increment lwp_procs */
    lwp_procs++;
    return lwp_procs-1;
}

void lwp_exit() {
    return;
}

int  lwp_getpid() {
    return lwp_running;
}

void lwp_yield() {
    lwp_running = lwp_sched();
    return;
}

void lwp_start() {
    return;
}

void lwp_stop() {
    return;
}

void lwp_set_scheduler(schedfun sched) {
    lwp_sched = sched;
    return;
}


