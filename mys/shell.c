/* startShell
 * create a pty
 * 
 * exec a shell with slave end duped into stdin,stdout,stderr
 * return the master end
 */
#include "global.h"
int startShell( struct termios *tm, struct winsize *ws) {
    int shpty;
    int slave;
	int pid;
    struct passwd *pw;
    char *shell;
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

    if(!(pid = fork())) {
        if (setsid() == -1) {
            perror("slave:setsid");
            exit(1);
        }

        slave = open(ptsname(shpty), O_RDWR, 0666);
        if (slave == -1) {
            perror("open:slave pty");
            exit(1);
        }

        close(shpty);
        dup2(slave, 0);
        dup2(slave, 1);
        dup2(slave, 2);

        set_winsize(STDIN_FILENO,ws);
        restore_mode(STDIN_FILENO, tm);

        /* get shell preference from env */
        shell = getenv("SHELL");
        if (shell == NULL) {
            /* try passwd */
            pw = getpwuid(getuid());
            if (pw->pw_shell == NULL) {
                /* user has no defined shell */
                fprintf(stderr, "user has no defined shell\n");
                exit(1);
            }
            shell = pw->pw_shell;
        }

        execl(shell,shell, NULL);


    }


    return shpty;    
}
