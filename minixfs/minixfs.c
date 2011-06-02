/* utility functions for dealing with a minix filesystem */
#include "minixfs.h"

SuperBlock *sb;

int hostendianness() {
	int i;
	char *cx;
	int x = 1;
	cx = (char *) &x;
	if (*cx) {
		// little endian
		return 1;
	}
	return 0;
}

uint8_t * readBlock( int size) {
	uint8_t *buffer;
	int rbytes, tbytes;
	
	buffer = malloc(size);
	if (buffer == NULL) {
		return NULL;
	}
	
	for (tbytes = 0; tbytes < size;) {
		rbytes = read(fd, buffer, size);
		if (rbytes == -1) {
			return NULL;
		}
		tbytes += rbytes;
	}
	return buffer;
}





