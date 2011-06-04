#include "minixfs.h"



void printInode(Inode *node) {
    printf("Contents of Inode:\n"
        "Is Directory\t");
    if(node->mode & DIR_FILE) {
        printf("YES\n");
    } else {
        printf("NO\n");
    }
}
Inode * getInode(uint32_t num) {
    Inode *node;
    int tbytes;
    int rbytes;

    num--;
    /* because we start at 1 for inode numbers */
    uint32_t offset= num*sizeof(Inode)+
                    (sb->zsize*(2+sb->i_blocks+sb->z_blocks));
    /*printf("offset = %d\n", offset);*/
    /* seek to the inode in the bitmap */
    if(lseek(fd,globalOffset+offset,SEEK_SET) == -1) {
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




Dirent * findInode( Inode *node, 
                    char *name, 
                    uint32_t namelen) {
    int i;
    uint8_t *buf;
    Dirent *d,*ret;
    int total;

    if (debug >3) 
        printf("Finding: %.*s\n", namelen, name);
        
    buf = getFile(node);
    if (!buf) {
        return NULL;
    }
    ret = malloc(sizeof(Dirent));
    if (!ret) {
        perror("malloc:findInode");
        return NULL;
    }
        
    d = (Dirent *) buf;
    total = node->size/sizeof(Dirent);

    for (i=0;i<total;i++) {
        if (!d->inode)  {
            d++;
            continue;
        }
        if (debug > 2) {
            fprintf(stderr, "%.*s %s\n",namelen, name, d->name);
        }
        if (d->name[namelen] == '\0') {
            if (!strncmp(name, d->name, namelen)) {
                if(!memcpy(ret, d, sizeof(Dirent))) {
                    perror("memcpy:");
                    exit(1);
                }
                /*printf("compare: %.*s %s\n",namelen,name, d->name);*/
                free(buf);
                return ret;
            }
        }
        d++;
    }
    
    return NULL;
}

