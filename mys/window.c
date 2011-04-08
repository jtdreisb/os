/* window size utilities provided my nico */
#include <sys/types.h>
#include <sys/ioctl.h>
#include <stdio.h>


void get_winsize(int fd, struct winsize *ws) {
    if(-1==ioctl(fd,TIOCGWINSZ,ws)){
        perror("ioctl get winsize");
    }
}

void set_winsize(int fd, struct winsize *ws) {
    if (-1 == ioctl(fd, TIOCSWINSZ, ws)) {
        perror("ioctl set winsize");
    }
}
