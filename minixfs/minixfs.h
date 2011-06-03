#include <sys/types.h>
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
/* 16 bites wide */
/* overlayable */
typedef struct {
    /* long */
    uint32_t        ninodes; 
    uint16_t        unused;
    uint16_t        i_blocks;
    uint16_t        z_blocks;
    uint16_t        firstdata;
    uint16_t        log_zone_size;
    uint16_t        pad;
    /* long */
    uint32_t        max_file;
    uint32_t        zones;
    uint16_t        magic;
    uint16_t        pad2;
    uint16_t        blocksize;
    uint16_t        subversion;
    
    /*useful stuff */
    uint32_t        zsize;
} SuperBlock;

/* Inode */
typedef struct {
    uint16_t        mode;
    uint16_t        links;
    uint16_t        uid;
    uint16_t        gid;
    uint32_t        size;
    uint32_t        atime;
    uint32_t        mtime;
    uint32_t        ctime;
    uint32_t        dzones[7];
    uint32_t        indirect;
    uint32_t        double_indirect;
    uint32_t        triple_indirect;
} Inode;

typedef struct {
    uint32_t inode;
    char name[60];
} Dirent;

typedef struct {
    uint8_t bootind;
    uint8_t start_head;
    uint8_t start_sec;
    uint8_t start_cyl;
    uint8_t type;
    uint8_t end_head;
    uint8_t end_sec;
    uint8_t end_cyl;
    uint32_t lFirst;
    uint32_t size;
    // uint32_t base;
    // uint32_t cylinders;
    // uint32_t sectors;
}Partition;

/* partition table gets pulled out of boot block */
typedef struct {
    /* has the bits set for the available partions */
    uint8_t pcount;
    Partition *part[4];
    /* be sure to free this */
    uint8_t *block;
}PartitionTable;




/* superblock will always be 1024 */
#define SUPERBLOCK_SIZE         1024
#define SECTOR_SIZE             512
#define PARTITION_TABLE_OFFSET  0x1BE
#define BOOTABLE                0x80
#define MINIX_TYPE              0x81

// permission masks
#define FILETYPE_MASK   0170000
#define REG_FILE        0100000
#define DIR_FILE        0040000
#define U_RD            0000400
#define U_WR            0000200
#define U_EX            0000100
#define G_RD            0000040
#define G_WR            0000020
#define G_EX            0000010
#define O_RD            0000004
#define O_WR            0000002
#define O_EX            0000001


extern SuperBlock *sb;
extern int fd;
extern int globalOffset;
extern int debug;
extern int mode;
#define MINLS  1
#define MINGET 2

void printSuperBlock();
SuperBlock * getSuperBlock();

PartitionTable * getPartitionTable();
void printPartition(Partition *p);
int isPartitioned(Partition *p);
int isMinix(Partition *p);

Inode * getInode(uint32_t num);
void printInode(char *path, Inode* node);
Dirent * doPath( char *path);
Inode * getInode(uint32_t num);
int getZone(uint8_t *dst, Inode *node, uint32_t index);
Dirent * findInode(Inode *node, char *name, uint32_t namelen);
uint8_t * readBlock( int size);
uint8_t * getFile(Inode *node);
void printFile(Dirent *d, int printDir);

