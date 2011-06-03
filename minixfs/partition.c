#include "minixfs.h"
#include <stdio.h>
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

/* anything that is handle be errno is returned with NULL pointer
 * otherwise we blow up ourselves 
 */
PartitionTable * getPartitionTable() {
	PartitionTable *pt;
	/* Partition *p;*/
	uint8_t * buffer;
	
	if (lseek(fd, globalOffset, SEEK_SET) == -1) {
		return NULL;
	}

	buffer = readBlock(SECTOR_SIZE);
	if (buffer == NULL) {
		return NULL;
	}

	/* check magic */
 	if (!(buffer[510] == 0x55) || !(buffer[511] == 0xAA)) {
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
