CC 	= gcc

CFLAGS  = -Wall -g 

LDFLAGS  = -Wall -g 

TARG = fs 

SRC=\
	main.c\
	minixfs.c\
	file.c\
	inode.c\
	super.c\
	partition.c\

HFILES=\
	   minixfs.h\

OBJS= $(patsubst %.c, %.o, $(SRC))

all: 	$(TARG) minls minget

minget: $(TARG)
	cp $(TARG) minget

minls: $(TARG)
	cp $(TARG) minls

clean:	
	rm -f $(OBJS) *~

%.o: %.c 
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARG): $(OBJS) $(HFILES)
	$(CC) $(LDFLAGS) -o $(TARG) $(OBJS) 


handin:
	handin pn-cs453 Asgn4 $(SRC) $(HFILES) Makefile README
