/* 
 * assignment 2
 * lwp.c
 */
#include "lwp.h"

int total_procs=0;
/* process table */
lwp_context lwp_ptable[LWP_PROC_LIMIT];
int lwp_procs   =  0;           /* the current number of LWPs  */
int lwp_running = -1;           /* the index of the currently running LWP */
unsigned long *stackToFree = NULL;
schedfun lwp_sched = NULL;
void * original_stack_pointer;

void setRunning() {
    if(lwp_sched) {
        /* should have checked for validity */
        lwp_running = lwp_sched();
    } else {
        /* not working */
        lwp_running++;
        if (lwp_running >= lwp_procs) {
            lwp_running = 0;
        }
    }
}

void cleanup() {
    int i;
    for (i=lwp_running; i < lwp_procs; i++) {
        lwp_ptable[i] = lwp_ptable[i+1];
    }
    i = lwp_running;
    /* get the next scheduled */
    setRunning();    
    if (i < lwp_running) {
        lwp_running--;
    }
}

/* because calling stuff with args screws it up */
void freeStack() { free(stackToFree); }

/* new_lwp
 *
 * parameters:
 * (lwpfun) f - 
 * (void *) argv - 
 * (size_t) stacksize - 
 *
 * return: pid
 */
int  new_lwp(lwpfun f, void * argv, size_t stacksize) {
    unsigned long bp;
    if (lwp_procs >= LWP_PROC_LIMIT) {
        return -1;
    }

    lwp_context *lwp = &lwp_ptable[lwp_procs];
    
    /* set pid, stacksize and stack */
    lwp->pid = ++total_procs;
    lwp->stacksize = stacksize;
    lwp->stack = malloc(stacksize*sizeof(long));
    if (!lwp->stack) {
        perror("malloc: stack");
        return -1;
    }

    /* write our 0xdeadbeef to the bottom of the stack */
    lwp->stack[0] = 0xdeadbeef;

    /* put the stackpointer at the highest memory location */
    lwp->sp = lwp->stack + lwp->stacksize-1;

    /* organization of stack
     *
     * |saved REGS (modify bp)|
     * |saved bp (trash value)|
     * |saved pc (return addr |
     * |lwp_exit(return addr) |
     * |argv pointer          |
     *
     * done in reverse order
     */

    /* argv pointer */
    *lwp->sp = (unsigned long)argv;
    lwp->sp--;  
    /*
     * return address of thread func (we use exit) 
     * this gets called when thread func returns
     */
    *lwp->sp = (unsigned long)lwp_exit;
    lwp->sp--;  
    /* this is the address of the thread func 
     * returned to in yeild or start
     */
    /* here we set the base pointer where we will index to argv */
    bp = (unsigned long)lwp->sp;
    *lwp->sp = (unsigned long)f;
    lwp->sp--; 
    /* trash value base pointer for lwp exit stack*/
    *lwp->sp = bp;
    /* this bp is one above the return value */
    bp = (unsigned long)lwp->sp;
    /* setup for the restore */
    lwp->sp -= 7;
    /* we need to set the base pointer reg */
    *lwp->sp = bp;

    /* everything succeeded increment lwp_procs */
    lwp_procs++;
    return total_procs;
}

/*
 * lwp_exit
 *
 * we build
 */
void lwp_exit() {
    lwp_procs--;
    /* saved into global so we can access after sp changes */
    stackToFree = lwp_ptable[lwp_running].stack;
    if (lwp_procs == 0) {
        SetSP(original_stack_pointer);
        /* free the stack of the last lwp */
        freeStack();
        lwp_stop();
    }
    /* cleanup sets new running proc */
    /* and it accounts for the missing proc */
    cleanup(); 

    /*SetSP(original_stack_pointer);*/
    freeStack();
    SetSP(lwp_ptable[lwp_running].sp);
    RESTORE_STATE();
    return;
}

int  lwp_getpid() {
    return lwp_ptable[lwp_running].pid;
}

void lwp_yield() {
    /* push everything onto our stack */
    SAVE_STATE();
    /* save our stack pointer in our process table */
    GetSP(lwp_ptable[lwp_running].sp);
    /*  now we grab the new process */
    setRunning();
    SetSP(lwp_ptable[lwp_running].sp);
    RESTORE_STATE();
    return;
}

void lwp_start() {
    SAVE_STATE();
    GetSP(original_stack_pointer);
    /* make sure we have threads to run */
    if (lwp_procs == 0) {
        SetSP(original_stack_pointer);
        RESTORE_STATE();
        /* dont do anything if we have no jobs */
        return;
    }
    /* pick a proc */
    setRunning(); 
    /* switch to new stack */
    SetSP(lwp_ptable[lwp_running].sp);
    RESTORE_STATE();
    return;
}

void lwp_stop() {
    SAVE_STATE();
    if (lwp_procs) {
        GetSP(lwp_ptable[lwp_running].sp);
    } else { 
        /* oops no more procs */
        RESTORE_STATE();
    }
    /* get back to "system" stack */
    SetSP(original_stack_pointer);
    RESTORE_STATE();
    return;
}

void lwp_set_scheduler(schedfun sched) {
    lwp_sched = sched;
}


