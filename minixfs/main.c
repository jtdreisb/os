/* main.c starting point for both minls and minget */
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include "minixfs.h"

// globals
char *partition = NULL;
char *subpartition = NULL;
int  debug = 3;
int fd = -1;

void usage() {
	printf("usage:"
		"\tfs filename\n");
}
void parseArgs(int argc, char ** argv) {
	
}

int main(int argc, char ** argv) {
/*	PartitionTable *pt; */
//	Inode *node;

	if (argc < 2) {
		usage();
		return 1;
	}

	fd = open(argv[1], O_RDONLY);
	if (fd == -1) {
		perror("Open:");
		return 1;
	}

	
	sb = getSuperBlock(0);
	if (sb == NULL) {
		perror("getSuperBlock");
		return 1;
	}


	//printSuperBlock();
	//printf("Got SuperBlock\n");
	//node = getInode(fd,sb,1);
	//viprintInode(fd, sb, node);
	doPath("/");
	doPath("/src");
	doPath("/src/Makefile/");
	doPath("/src/Makefile");
	// doPath("/Hello");
	//printInode()
	/* partition table */
	/*pt = getPartitionTable(fd, 0);
	
	if (pt == NULL) {
		perror("PartitionTable");
		return 1;
	}
	
	if (v > 0) {
		printPartition(pt->part[0]);
		printPartition(pt->part[1]);
		printPartition(pt->part[2]);
		printPartition(pt->part[3]);
	}*/

	// printf("part[0] %p\n", pt->part[0]);
	// printf("part[0] %p\n", pt->part[1]);
	
	//free(pt->block);
	// free(pt);
	//free(node);
	free(sb);
	close(fd);
	return 0;
}