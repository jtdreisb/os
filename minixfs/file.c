#include "minixfs.h"

/* 	
	skips first character if its a / 
	otherwise will return amt of chars until \0 or /
*/
int countChars(char *path) {
	int i = 0;
	if (path[0] == '/') {
		path++;
	}
	for (i=0; path[i] != '\0' && path[i] != '/'; i++) 
		;
	return i;
}
/*
 node_num is the inode to retrieve and look for the rest of the path 
*/
#define MAX_LEN 60

uint8_t * getZone(Inode *node, uint32_t index) {
	uint8_t *buf;
	uint32_t znum, offset;
	if (index < 7) {
		 znum = node->dzones[index];
	} else {
		 znum = 0;
		/* go indirect */
	}
	if (znum == 0)
		return NULL;
		
	if (debug > 3) {
		//printf("Looking in dzones[%d]\n", index);
	}
	
	offset = znum*sb->zsize;
	if (lseek(fd,offset, SEEK_SET) == -1) {
		perror ("lseek");
		exit(1);
	}
	buf = readBlock(sb->zsize);
	if (!buf) {
		perror("readBlock");
		exit(1);
	}
	
	return buf;
}

Dirent * findInode(
					Inode *node, 
					char *name, 
					uint32_t namelen) {
	int i;
	uint8_t *buf;
	Dirent *d,*ret;
	

	if (debug >3) 
		printf("Finding: %.*s\n", namelen, name);
		
	buf = getZone(node,0);
	if (!buf) {
		return NULL;
	}
	ret = malloc(sizeof(Dirent));
	if (!ret) {
		perror("malloc:findInode");
		return NULL;
	}
		
	d = (Dirent *) buf;
	
	for (i=0;i<(node->links+2);d++) {
		if (!d->inode)  {
			continue;
		}
		
		
		if (!strncmp(name, d->name, namelen-1)) {
			if(!memcpy(ret,d, sizeof(Dirent))) {
				perror("memcpy:");
				exit(1);
			}
			printf("compare: %.*s %s\n",namelen,name, d->name);
			free(buf);
			return ret;
		}
		i++;
	}
	
	return NULL;
}



void doPath(char *path) {
	int namelen;
	Inode *node;
	Dirent *d, root;
	char *name;
	d = &root;
	root.inode = 1;
	strncpy(root.name, path, 60);
	/* find the first real character */
	name = path;
	for (;*name == '/';)
		name++;
	// printf("before: %s\n", name);
	for (;;) {
		node = getInode(d->inode);
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
			break;
		}
		d = findInode(node, name, namelen);
		if (d == NULL) {
			fprintf(stderr, "%s: File not found\n",path);
			return;
		}
		name += namelen;
		for (;*name == '/';)
			name++;
		
		if (*name == '\0') {
			break;
		}
			
		
		free(node);
		//free(d);
	}
	
	/* this must switch between ls & get */
	printf("%s:\n",path);
	printFile(d,1);

	return;
}

void printdir(Inode *node) {
	int i;
	uint8_t *buf;
	Dirent *d,*ret;
	
		
	buf = getZone(node,0);
	if (!buf) {
		perror("getZone:");
		return;
	}
	ret = malloc(sizeof(Dirent));
	if (!ret) {
		perror("malloc:findInode");
		return;
	}
		
	d = (Dirent *) buf;
	for (i=0;i<(node->links+2);) {

		if (d->inode)  {
			printFile(d,0);
			i++;
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
// Inode *node = getInode(d->inode);
// void printInode(char *path, Inode* node) {
// 	/*printf()*/
// 	/* TODO: 
// 		make this print out like ls 
// 	*/
// 	int i;
// 	Dirent *d;
// 	uint8_t *buf;
// 
// 	if (node->mode & DIR_FILE) {
// 		printf("directory:\n");
// 		printf("links %d\n", node->links);
// 		printf("dzone %d\n",node->dzones[0]);
// 		
// 		if (lseek(fd,node->dzones[0]*sb->blocksize, SEEK_SET) == -1) {
// 			return;
// 		}
// 		buf = readBlock(sb->blocksize);
// 		d = (Dirent *) buf;			
// 		printf("zone loc : %d\n", node->dzones[0]*sb->blocksize);
// 		for ( i=0; i<node->links+2; i++) {
// 			/*	important 
// 			  	use the .60 to limit the
// 			 	number of chars printed 
// 			*/
// 			printf("%d\t%.60s\n", d->inode, d->name);
// 			d++;
// 		}
// 	} else {
// 		printf("inode is a file\n");
// 		printf("%d", node->mode);
// 	}
// 	free(buf);
// }