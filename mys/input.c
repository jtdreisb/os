#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
/*
 * inputForward starts a process that reads from stdin 
 * and blocks until input is read. Then it forwards to the
 * master end of the pty
 *
 *
 * slave - master end of the pty
 */

#define BUF_SIZE 4096
int fd;

void sig_handler(int signum) {
    close(fd);
    exit(0);
}

int set_signal() {
    struct sigaction sa;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    sa.sa_handler = sig_handler;
    return sigaction(SIGTERM,&sa, NULL); 
}

int inputForward(int slave) {
    int pid;
    int in,out;
    char buf[BUF_SIZE];
    fd = slave;
    if (!(pid = fork())) {
        if (set_signal() == -1) {
            return -1;
        }
        /* lets get to the input shoveling */
        for (;;) {
            in = read(STDIN_FILENO, buf,  BUF_SIZE); 
            if (in == -1) {
                perror("input: read");
                exit(1);
            }
            if (in > 0) {
                out = 0;
                while (out != in) {
                    out += write(slave, buf+out, in-out);
                }
            }
        }
    }
    /* fprintf(stderr, "proc: %d\n", pid);*/
    return pid;
}
