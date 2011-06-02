#include "minixfs.h"


Inode * getInode(uint32_t num) {
	Inode *node;
	int tbytes;
	int rbytes;

	num--;/* because we start at 1 for inode numbers */
	uint32_t offset =
	 		num*sizeof(Inode)+(sb->zsize*(2+sb->i_blocks+sb->z_blocks));
	/*printf("offset = %d\n", offset);*/
	/* seek to the inode in the bitmap */
	if(lseek(fd,offset,SEEK_SET) == -1) {
		return NULL;
	}
	
	node = malloc(sizeof(Inode));
	if (node == NULL) {
		return NULL;
	}
	for (tbytes = 0; tbytes < sizeof(Inode);) {
		rbytes = read(fd, node, sizeof(Inode));
		if (rbytes == -1) {
			return NULL;
		}
		tbytes += rbytes;
	}

	return node;
}