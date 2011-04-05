
#define _XOPEN_SOURCE 600
#define _POSIX_C_SOURCE 200112L
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

/* startShell
 * create a pty
 * 
 * exec a shell with slave end duped into stdin,stdout,stderr
 * return the master end
 */
int startShell(int *pid) {
    int shpty;
    /* 
     * make pty... 
     */
    shpty = posix_openpt(O_RDWR|O_NOCTTY);
    if (shpty == -1) {
        perror("posix_openpt");
        exit(1);
    }

    if(grantpt(shpty) != 0) {
        perror("grantpt");
        exit(2);
    }

    if (unlockpt(shpty) != 0) {
        perror("unlockpt");
        exit(3);
    }

    if(!(*pid = fork())) {

    }


    return shpty;    
}
