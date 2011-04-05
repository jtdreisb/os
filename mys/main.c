/*
 * mys
 * Assignment 1
 * Jason Dreisbach
 * 3/31/11
 *
 * This is a script utility
 */ 


#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <fcntl.h>
#include <sys/wait.h>
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

int main(int argc, char ** argv) {

    int pid, status;
    int pids[2];
    char *outputfile = "typescript";
    /* fd of ouput file */
    int outfd;
    /* fd of the open pty  */
    int shpty;
    struct termios oldterm;
    struct winsize oldwin;
    
    /* there should be no more than 2 arguments */
    if (argc > 2) {
        fprintf(stderr, "usage:\n\tmys <typscript>\n");
        exit(1);
    } else if (argc == 2) {
        /* arg 1 should be the name of the file  */
        outputfile = argv[1];
    }

    outfd = open(outputfile, O_WRONLY|O_CREAT, 0666);
    if (outfd == -1) {
       perror("open: typescript"); 
       exit(1);
    }
    
    get_winsize(STDIN_FILENO,&oldwin);
    raw_mode(STDIN_FILENO, &oldterm);

    /* start the slave process and return the fd we use to communicate with it */
    /*shpty = startShell(pids);*/
    /* start input forwarding process */
    pids[1] = inputForward(shpty);
    if (pids[1] == -1) {
        perror("inputforward");
    };
   
/* do the ouput shoveling and archiving */

    restore_mode(STDIN_FILENO, &oldterm);

    kill(pids[0], SIGTERM);
    kill(pids[1], SIGTERM);
    close(outfd);
    close(shpty);
    pid = wait(&status);
    if (status) {
        fprintf(stderr, "proc %d exited with status %d", pid, status);
    }
    pid = wait(&status);
    if (status) {
        fprintf(stderr, "proc %d exited with status %d", pid, status);
    }
    return 0;
}