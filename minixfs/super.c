#include "minixfs.h"

/* 
 * prints the values of the superblock
 */
void printSuperBlock() {
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

/* 
 * gets a superblock struct filled.
 * returns NULL on error (check perror)
 */
SuperBlock * getSuperBlock() {
	SuperBlock *sb;
	if (lseek(fd, SUPERBLOCK_SIZE + globalOffset, SEEK_SET) == -1) {
		return NULL;
	}
	sb = (SuperBlock*)readBlock(sizeof(SuperBlock));
	sb->zsize = sb->blocksize << sb->log_zone_size;
	return sb;
}