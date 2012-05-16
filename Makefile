SDK_BIN_PATH = bin

AS = $(SDK_BIN_PATH)/as
CC = $(SDK_BIN_PATH)/clang
LD = $(SDK_BIN_PATH)/ld

CFLAGS = -O2 -Wall
LDFLAGS=

SOURCES=src/main.c src/func.c

OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=a.out

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -ccc-host-triple dcpu16 -S -Iinclude -o $*.s
	$(AS) -o $*.o $*.s

clean:
	rm src/*.o
	rm src/*.s
	rm $(EXECUTABLE)
