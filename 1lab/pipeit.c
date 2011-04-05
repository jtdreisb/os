/* pipeit
 * Jason Dreisbach
 *
 * This program takes no arguments and then
 * starts the pipleline
 * ls | sort -r > outfile”
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char ** argv) {

    int pid;
    int err, ret;
    int p[2];
    int outfile;

    /* Shouldn't be any arguments */
    if ( argc != 1 ) {
        exit(1);
    }

    err = pipe(p);
    if ( err == -1 ) {
        perror("pipe");
        exit(1);
    }

    pid = fork();

    if (pid == 0) {
        /* in ls proc */
        dup2(p[1], STDOUT_FILENO);
        execlp("ls", "ls", NULL);
    }
    close(p[1]);
    outfile = open("outfile", (O_CREAT | O_WRONLY), 0666);
    if ( outfile == -1 ) {
        perror("open");
        exit(1);
    }

    pid = fork();

    if (pid == 0) {
        /* sort proc */
        dup2(p[0], STDIN_FILENO);
        dup2(outfile, STDOUT_FILENO);
        execlp("sort", "sort", "-r", NULL);
    }
    close(outfile);

    ret = 0;
    wait(&err);
    ret += err;
    wait(&err);
    ret += err;


    return ret;
}
