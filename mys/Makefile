CC = gcc

CFLAGS =  -pedantic -Wall -g

LDFLAGS =

TARGET = mys

HANDIN = Asgn1 

SRC = \
    main.c \
    modes.c \
    window.c \
	shell.c \
	input.c \
	output.c \

OBJS = $(patsubst %.c, %.o, $(SRC))

HEADERS = 

all: $(TARGET)

allclean: clean
	rm -f $(TARGET)
clean:
	rm -f $(OBJS)
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJS) 

tags: $(SRC) $(HEADERS)
	cscope -b $(SRC) $(HEADERS)
handin: 
	handin pn-cs453 $(HANDIN) $(SRC) $(HEADERS) Makefile README 
test:
	./$(TARGET) input.test 
