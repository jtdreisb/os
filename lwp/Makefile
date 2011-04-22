CC 	= gcc

CFLAGS  = -Wall -g -I ../include

LD 	= gcc

LDFLAGS  = -Wall -g 

PUBFILES =  README  hungrymain.c  libPLN.a  libsnakes.a  lwp.h\
	    numbersmain.c  snakemain.c  snakes.h

TARGET =  

PROGS	= snakes nums hungry bench myhungry mynums mysnakes

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

mysnakes: snakemain.o  libsnakes.a
	$(LD) $(LDFLAGS) -o mysnakes snakemain.o -L. -lncurses -lsnakes -llwp

snakes: snakemain.o  libsnakes.a
	$(LD) $(LDFLAGS) -o snakes snakemain.o -L. -lncurses -lsnakes -lPLN

hungry: hungrymain.o  libsnakes.a
	$(LD) $(LDFLAGS) -o hungry hungrymain.o -L. -lncurses -lsnakes -lPLN

myhungry: hungrymain.o  libsnakes.a
	$(LD) $(LDFLAGS) -o myhungry hungrymain.o -L. -lncurses -lsnakes -llwp

nums: numbersmain.o  liblwp.a
	$(LD) $(LDFLAGS) -o nums numbersmain.o -L. -lPLN

mynums: numbersmain.o  liblwp.a
	$(LD) $(LDFLAGS) -o mynums numbersmain.o -L. -llwp

hungrymain.o: lwp.h snakes.h

snakemain.o: lwp.h snakes.h

numbermain.o: lwp.h

main.o: lwp.h liblwp.a

liblwp.a: lwp.c lwp.h
	gcc $(CFLAGS) -c lwp.c
	ar r liblwp.a lwp.o
	rm lwp.o


pub:
	scp $(PUBFILES) $(TARGET)
bench: main.o liblwp.a
	$(LD) $(LDFLAGS) -o bench main.o -L. -llwp

