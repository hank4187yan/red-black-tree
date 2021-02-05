CC = g++
LD = ld

INCLUDE = -I./

CFLAGS = -Wall -c -ggdb3 

LDFLAGS= -lm -lrt -lz -lpthread -ldl -ltcmalloc

SRCDIR = ./
BINDIR = ./
SRCS = $(wildcard $(SRCDIR)/*.c $(SRCDIR)/*.cc)
OBJS = $(patsubst %c, %o, $(patsubst %cc, %o, $(SRCS)))

TARGET = $(BINDIR)rb_test

.PHONY: all clean

all: $(TARGET)
$(TARGET): $(OBJS)
#	@echo $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)
%o: %cpp
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ $<
%o: %c
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ $<
clean:
	rm -f $(SRCDIR)*.o
	rm -f $(TARGET)
