/* utility functions for dealing with a minix filesystem */
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "minixfs.h"


int hostendianness() {
	int i;
	char *cx;
	int x = 1;
	cx = (char *) &x;
	for(i = 0; i < sizeof(int); i++) {
		printf("%2x\t", *(cx+i));
	}
	printf("\n");
	if (*cx) {
		// little endian
		return 1;
	}
	return 0;
}

uint8_t * readBlock(int fd, int size) {
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


/* 
 * prints the values of the superblock
 */
void printSuperBlock(SuperBlock *sb) {
	printf(
		"SuperBlock Contents:\n"
		"Stored Fields:\n"
		"\tninodes\t\t%10u\n"// long 
		 // "\tunused\t%10hu\n"	 // short
		"\ti_blocks\t%10hu\n"// short 	
		"\tz_blocks\t%10hu\n"// short 	
		"\tfirstdata\t%10hu\n"// short 	
		"\tlog_zone_size\t%10hu\n"// short 
		// "\tpad\t%10hu\n"	  // short
		"\tmax_file\t%10u\n"// long 	
		"\tzones\t\t%10u\n"// long 	
		"\tmagic\t\t%10hu\n"// short 	
		// "\tpad2\t%10hu\n"// short	
		"\tblocksize\t%10hu\n"// short 	
		"\tsubversion\t%10hu\n"// short
		,	
		 sb->ninodes, 
		 // sb->unused,
		 sb->i_blocks,
		 sb->z_blocks,
		 sb->firstdata,
		 sb->log_zone_size,
		 // sb->pad,
		 sb->max_file,
		 sb->zones,
		 sb->magic,
		 // sb->pad2,
		 sb->blocksize,
		 sb->subversion
		);
}

/* prints the partition info */ 
void printPartition(Partition *p) {
	char *boot;
	char *isminix;
	if (p->bootind == BOOTABLE) {
		boot = "YES";
	} else {
		boot = "NO";
	}
	if (p->type == MINIX_TYPE) {
		isminix = "(minix)";
	} else {
		isminix = "";
	}
	printf("Partition:\n"
		"\tbootable:\t%10s\n"
		"\tstart_head:\t%10hu\n"
		"\tstart_sec:\t%10hu\n"
		"\tstart_cyl:\t%10hu\n"
		"\ttype:\t\t%10hu%s\n"
		"\tend_head:\t%10hu\n"
		"\tend_sec:\t%10hu\n"		
		"\tend_cyl:\t%10hu\n"
		"\tlFirst:\t\t%10hu\n"
		"\tsize:\t\t%10u\n"
		,
		
		boot,
		p->start_head,
		p->start_sec,
		p->start_cyl,
		p->type,
		isminix,
		p->end_head,
		p->end_sec,
		p->end_cyl,
		p->lFirst,
		p->size
		);
}


/* 
 * gets a superblock struct filled.
 * returns NULL on error (check perror)
 */
SuperBlock * getSuperBlock(int fd, int offset) {
	SuperBlock *sb;
	if (lseek(fd, SUPERBLOCK_SIZE + offset, SEEK_SET) == -1) {
		return NULL;
	}

	sb = (SuperBlock*)readBlock(fd,sizeof(SuperBlock));
	if (sb == NULL) {
		return NULL;
	}

	return sb;
}


/*
 * checks for valid magic values 
 */
int isPartitioned(Partition *p) {
	/* check for 0x55 in 510 */
	/* check for 0xAA in 511 */
	return 0;
}

int isMinix(Partition *p) {
	return 0;
}

/* anything that is handle be errno is returned with NULL pointer
 * otherwise we blow up ourselves 
 */
PartitionTable * getPartitionTable(int fd, int offset) {
	PartitionTable *pt;
	/* Partition *p;*/
	uint8_t * buffer;
	
	if (lseek(fd, offset, SEEK_SET) == -1) {
		return NULL;
	}

	buffer = readBlock(fd, SECTOR_SIZE);
	if (buffer == NULL) {
		return NULL;
	}

	/* check magic */
 	if (!((buffer[510] == 0x55) && (buffer[511] == 0xAA))) {
		free(buffer);
		fprintf(stderr, "Invalid magic number in boot block\n");
		exit(1);
	}
	
	/* we have a valid partition table */
	pt = malloc(sizeof(PartitionTable));
	if (pt == NULL) {
		free(buffer);
		return NULL;
	}
	
	pt->block = buffer;
	pt->part[0] = (Partition *) &buffer[PARTITION_TABLE_OFFSET];
	pt->part[1] = (Partition *) pt->part[0] + 1;
	pt->part[2] = (Partition *) pt->part[0] + 2;
	pt->part[3] = (Partition *) pt->part[0] + 3;
	
	return pt;
}



void printInode(int fd,SuperBlock *sb, Inode* node) {
	/*printf()*/
	int i;
	Dirent *d;
	uint8_t *buf;
	if (node->mode & DIR_FILE) {
		printf("directory:\n");
		printf("links %d\n", node->links);
		printf("dzone %d\n",node->dzones[0]);
		
		if (lseek(fd,node->dzones[0]*sb->blocksize, SEEK_SET) == -1) {
			return;
		}
		buf = readBlock(fd,sb->blocksize);
		d = (Dirent *) buf;			
		printf("zone loc : %d\n", node->dzones[0]*sb->blocksize);
		for ( i=0; i<node->links+2; i++) {
			printf("%d\t%s\n", d->inode, d->name);
			d++;
		}
	} else {
		printf("inode is a file\n");
		printf("%d", node->mode);
	}
	free(buf);
}



Inode * getInode(int fd, SuperBlock *sb, uint32_t num) {
	Inode *node;
	int tbytes;
	int rbytes;
	num--;/* because we start at 1 for inode numbers */
	uint32_t offset = num+(sb->blocksize*(2+sb->i_blocks+sb->z_blocks));
	printf("offset = %d\n", offset);
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