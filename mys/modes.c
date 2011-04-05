/* line discipline modes */

#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <stdlib.h>

void raw_mode(int fd, struct termios *old) {
    struct termios tio;

    if (!isatty(fd)) {
        fprintf(stderr, "raw_mode: fd is not a tty\n");
        exit(1);
    }

    if (tcgetattr(fd,old)) {
        perror("tcgetattr");
        exit(1);
    }

    tio = *old;
    tio.c_lflag &= ~(ECHO|ECHOE|ECHOK|ECHONL|ICANON|ISIG);
    tio.c_cc[VMIN] = 1;
    tio.c_cc[VTIME] = 0;
    if (tcsetattr(fd,TCSAFLUSH,&tio)) {
        perror("tcsetattr");
        exit(1);
    }
}


void restore_mode(int fd, struct termios *old) {
    if (!isatty(fd)) {
        fprintf(stderr, "restore_mode: fd is not a tty\n");
        exit(1);
    }

    if (tcsetattr(fd,TCSAFLUSH,old)) {
        perror("tcsetattr");
        exit(1);
    }
}
