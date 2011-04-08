/* 
 * main output loop
 * copies from master end of pty to stdout
 */
#include "global.h"

int output_archive(int slave, int outfd) {
    int n,w;
    char buf[BUF_SIZE];
    for (;;) {
        n = read(slave, buf,BUF_SIZE);
        
        if (n > 0) {
            w = 0;
            while (w != n) {
                w += write(outfd, buf+w, n-w);
            }
            w = 0;
            while (w != n) {
                w += write(STDOUT_FILENO, buf+w, n-w);
            }
        } else {
			return n;
		}
    }
}
