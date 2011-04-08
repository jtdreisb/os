/* global header
 * 
 * kicks off slave proc that runs a shell connected to a 
 * pty
 */
#define _XOPEN_SOURCE 600
#define _POSIX_C_SOURCE 200112L
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <pwd.h>
#include <strings.h>
#include <string.h>
#include <time.h>

#define DEBUG 0

#define BUF_SIZE 100


int startShell();
int inputForward(int slave);
int output_archive(int slave, int outfd);

void raw_mode(int fd, struct termios *old);
void restore_mode(int fd, struct termios *old);


void get_winsize(int fd, struct winsize *ws);
void set_winsize(int fd, struct winsize *ws);
