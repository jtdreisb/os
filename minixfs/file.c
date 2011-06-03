#include "minixfs.h"


/*
 node_num is the inode to retrieve and look for the rest of the path
*/
int getZone(uint8_t *dst, Inode *node, uint32_t index) {
    uint32_t znum, offset, index1, index2;
    uint32_t indmax = sb->zsize/4;
    uint32_t *ind;
    if (index < 7) {
         znum = node->dzones[index];
    } else if (index < indmax) {
        /* go indirect */
        index -= 7;
        offset = node->indirect*sb->zsize;
        if (lseek(fd,globalOffset + offset, SEEK_SET) == -1) {
            perror ("lseek");
            exit(1);
        }
        ind = (uint32_t *)readBlock(sb->zsize);
        if (!ind) {
            perror("readBlock");
            exit(1);
        }
        znum = ind[index];
        free(ind);

    } else {
        /* do the double */
        fprintf(stderr, "double indirect not implemented\n");
        index -= indmax - 7;
        offset = node->double_indirect*sb->zsize;
        if (lseek(fd,globalOffset+offset, SEEK_SET) == -1) {
            perror ("lseek");
            exit(1);
        }
        ind = (uint32_t *)readBlock(sb->zsize);
        if (!ind) {
            perror("readBlock");
            exit(1);
        }
        index1 = index/indmax;
        offset = ind[index1]*sb->zsize;
        free(ind);
        if (lseek(fd,globalOffset+offset, SEEK_SET) == -1) {
            perror ("lseek");
            exit(1);
        }
        ind = (uint32_t *)readBlock(sb->zsize);
        if (!ind) {
            perror("readBlock");
            exit(1);
        }
        index2 = index - index1;
        znum = ind[index2];
        free(ind);
    }
    if (znum == 0) {
        if(memset(dst, 0, sb->zsize) == NULL) {
            perror("memset");
            exit(1);
        }
        return 0;
    }

    
    offset = znum*sb->zsize;
    if (lseek(fd,globalOffset+offset, SEEK_SET) == -1) {
        perror ("lseek");
        exit(1);
    }
    if(read(fd,dst,sb->zsize) == -1) {
        perror("read");
        exit(1);
    }
    
    return 0;
}

/* we read out the whole file and dump it to the caller */
uint8_t * getFile(Inode *node) {
    /* we want a total of node->size bytes */
    uint32_t numzones,i;
    uint8_t *buf;
    if (node == NULL) 
        return NULL;
    /* memcpy() */
    /* node->size */
    fprintf(stderr, "size / sb->zsize = %d / %d\n",node->size , sb->zsize);
    numzones = (node->size / sb->zsize) + 1;

    buf = malloc(numzones*sb->zsize);
    if (buf == NULL)
        return NULL;

    for (i=0; i<numzones; i++) {
        if(getZone(buf+(sb->zsize*i),node,i)) {
            fprintf(stderr, "unknown error getting zones\n");
        }
    }
    /* todo */
    return buf;
}

#define MAX_LEN 60
/* the show */
Dirent * doPath(char *path) {
    int namelen, nextNode = 1;
    Inode *node;
    Dirent *d, *root;
    char *name;
    
    root = malloc(sizeof(Dirent));
    if (root == NULL) {
        perror("malloc:doPath");
        exit(1);
    }
    d = root;
    root->inode = 1;
    strncpy(root->name, path, 60);
    /* find the first real character */
    name = path;
    for (;*name == '/';)
        name++;
    // printf("before: %s\n", name);
    for (;;) {
        node = getInode(nextNode);
        if (!node) {
            fprintf(stderr, "inode %d could not be found\n",d->inode);
            exit(1);
        }
        
        /* count the length of the character */
        for (namelen = 0;;namelen++) {
            if (name[namelen] == '/') {
                break;
            } else if (name[namelen] == '\0') {
                break;
            } else if (namelen == MAX_LEN) {
                break;
            }
        }
        
        /* check to see if no more */
        if (namelen == 0) {
            /*fprintf(stderr,"breaking out early\n");*/
            break;
        }
        if (debug > 1) {
            fprintf(stderr, "part: %.*s\n",namelen, name);
        }
        d = findInode(node, name, namelen);
        if (d == NULL) {
            fprintf(stderr, "%s: File not found\n",path);
            exit(1);
        }
        name += namelen;
        
        for (;*name == '/';)
            name++;
        
        if (*name == '\0') {
            break;
        }
        nextNode = d->inode;
        free(node);
        free(d);
    }
    

    
    /* this must switch between ls & get */
    
    free (node);
    
    if (d != root) {
        free(root);
    }
    return d;
}

void printdir(Inode *node) {
    int i;
    uint8_t *buf;
    Dirent *d,*ret;
    uint32_t total;

    buf = getFile(node);
    if (!buf) {
        perror("getZone:");
        return;
    }
    ret = malloc(sizeof(Dirent));
    if (!ret) {
        perror("malloc:findInode");
        return;
    }
    total = node->size/sizeof(Dirent);
    d = (Dirent *) buf;
    for (i=0;i<total;i++) {
        
        if (d->inode)  {
            printFile(d,0);
        }
        d++;
    }
    return;
}
void printFile(Dirent *d, int printDir) {
    
    Inode *node = getInode(d->inode);
    
    if (node->mode & DIR_FILE) {
        if (printDir) {
            printdir(node);
            return;
        }
        printf("d");
    } else {
        printf("-");
    }
    /* owner */
    if(node->mode & U_RD)
        printf("r");
    else
        printf("-");
    if(node->mode & U_WR)
        printf("w");
    else
        printf("-");
    if(node->mode & U_EX)
        printf("x");
    else
        printf("-");
        
    /* group */
    if(node->mode & G_RD)
        printf("r");
    else
        printf("-");
    if(node->mode & G_WR)
        printf("w");
    else
        printf("-");
    if(node->mode & G_EX)
        printf("x");
    else
        printf("-");

    /* other */
    if(node->mode & O_RD)
        printf("r");
    else
        printf("-");
    if(node->mode & O_WR)
        printf("w");
    else
        printf("-");
    if(node->mode & O_EX)
        printf("x");
    else
        printf("-");
        
    /* size */
    printf("%9d", node->size);
    printf(" %.60s\n", d->name);
        
}   
