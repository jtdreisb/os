CC 	= gcc

CFLAGS  = -Wall -g -I ../include

LD 	= gcc

LDFLAGS  = -Wall -g 

PUBFILES =  README  hungrymain.c  libPN.a  libsnakes.a  lwp.h\
	    numbersmain.c  snakemain.c  snakes.h

TARGET =  .

PROGS	= snakes nums hungry

SNAKEOBJS  = snakemain.o 

HUNGRYOBJS = hungrymain.o 

NUMOBJS    = numbersmain.o

OBJS	= $(SNAKEOBJS) $(HUNGRYOBJS) $(NUMOBJS) 

SRCS	= snakemain.c numbersmain.c

HDRS	= 

EXTRACLEAN = core $(PROGS)

all: 	$(PROGS)

allclean: clean
	@rm -f $(EXTRACLEAN)

clean:	
	rm -f $(OBJS) *~ TAGS

snakes: snakemain.o libPN.a libsnakes.a
	$(LD) $(LDFLAGS) -o snakes snakemain.o -L. -lncurses -lsnakes -lPN

hungry: hungrymain.o libPN.a libsnakes.a
	$(LD) $(LDFLAGS) -o hungry hungrymain.o -L. -lncurses -lsnakes -lPN

nums: numbersmain.o libPN.a 
	$(LD) $(LDFLAGS) -o nums numbersmain.o -L. -lPN

hungrymain.o: lwp.h snakes.h

snakemain.o: lwp.h snakes.h

numbermain.o: lwp.h

libPN.a: lwp.c
	gcc -c lwp.c
	ar r libPN.a lwp.o
	rm lwp.o

pub:
	scp $(PUBFILES) $(TARGET)

