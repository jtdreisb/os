CC = gcc

CFLAGS = -ansi -pedantic -Wall -g

LDFLAGS =

TARGET = pipeit
# handin fmt "assignment <extra files>"
HANDIN = Lab01 jtdreisb.jpg

SRC = \
	pipeit.c \

OBJS = $(patsubst %.c, %.o, $(SRC))

HEADERS = 

all: $(TARGET)

allclean: clean
clean:
	rm -f $(TARGET)
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
