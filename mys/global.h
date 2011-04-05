/* global header
 * 
 * kicks off slave proc that runs a shell connected to a 
 * pty
 */


int startShell();
int inputForward(int slave);

void raw_mode(int fd, struct termios *old);
void restore_mode(int fd, struct termios *old);


void get_winsize(int fd, struct winsize *ws);
void set_winsize(int fd, struct winsize *ws);
