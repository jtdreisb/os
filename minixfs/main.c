/* main.c starting point for both minls and minget */
#include <fcntl.h>
#include <unistd.h>
#include "minixfs.h"


// globals
int mode = MINLS;
int partition = -1;
int subpartition = -1;
int debug = 0;
int fd = -1;
char *imgfile = NULL;
char *path = "/";
char *out;
int globalOffset = 0;

void usage() {
    printf("usage:\n\t");
    if (mode == MINLS) {
        printf("minls");
    } else {
        printf("minget\n");
    }
    printf(" [-v] [-p part[-s subpart]] imagefile");
    if (mode == MINLS) {
        printf("[path]\n");
    } else {
        printf("srcpath [dstpath]\n");
    }
}

void parseArgs(int argc, char ** argv) {
    int i;
    int nonflags = 0;
    if (argc < 2) {
        usage();
        exit(1);
    }
    if (!strcmp(argv[0], "minls")) {
        mode = MINLS;
    } else if(!strcmp(argv[0],"minget")) {
        mode = MINGET;
    }
    for (i=1; i<argc; i++) {
        if (!strncmp("-p",argv[i], 2)) {
            i++;
            partition = strtol(argv[i], NULL, 10);
            if (partition > 3 || partition < 0) {
                fprintf(stderr,"Partitions #'s must be 0-3\n");
                exit(1);
            }
        } else if(!strncmp("-s",argv[i], 2)) {
            if (partition == -1) {
                usage();
                exit(1);
            }
            i++;
            subpartition = strtol(argv[i], NULL, 10);
            if (subpartition > 3 || subpartition < 0) {
                fprintf(stderr,"Partitions #'s must be 0-3\n");
                exit(1);
            }
        } else if (!strncmp("-v",argv[i],2)) {
            debug++;
        } else {
            if (nonflags == 0) {
                imgfile = argv[i];
            } else if (nonflags == 1) {
                path = argv[i];
            } else if (mode == MINGET) {
                if (nonflags == 2) {
                    out = argv[i];
                } else {
                    usage();
                    exit(1);
                }
            } else {
                usage();
                exit(1);
            }
            nonflags++;
        }  
    }
    if (nonflags < 1) {
        usage();
        exit(1);
    }
}

int main(int argc, char ** argv) {
  PartitionTable *pt;
    Inode *node;
    parseArgs(argc,argv);
   /* printf("path = %s\n file = %s\n",path,imgfile);*/
    /*printf("part: %d\nsub: %d\n",partition, subpartition);*/

    fd = open(imgfile, O_RDONLY);
    if (fd == -1) {
        perror("Open");
        return 1;
    }
    /* get offset by partition */
    if (partition != -1) {
        pt = getPartitionTable(globalOffset);
        if (pt == NULL) {
            perror("Partition");
            exit(1);
        }
        globalOffset = pt->part[partition]->lFirst*SECTOR_SIZE;
        if (debug) {
            printPartition(pt->part[partition]);
        }
        free(pt->block);
        free(pt);
    }
    
    if (subpartition != -1) {
        pt = getPartitionTable(globalOffset);
        if (pt == NULL) {
            perror("Subpartition");
            exit(1);
        }
        globalOffset = pt->part[subpartition]->lFirst*SECTOR_SIZE;
        if (debug) {
            printPartition(pt->part[subpartition]);
        }
        free(pt->block);
        free(pt);
    }
    
    sb = getSuperBlock();
    if (sb == NULL) {
        perror("getSuperBlock");
        return 1;
    }


    if (debug) {
        printSuperBlock();
    }
    //printf("Got SuperBlock\n");
    //node = getInode(fd,sb,1);
    //viprintInode(fd, sb, node);
    node = doPath(path);
    free(node);

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
    
    //free(node);
    free(sb);
    close(fd);
    return 0;
}