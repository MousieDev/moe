# moe - minimal open editor
# See LICENSE for copyright and license details.

include config.mk

SRC = moe.c
OBJ = $(SRC:.c=.o)

all: options moe

options:
	@echo moe build options:
	@echo "CFLAGS  = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "CC      = $(CC)"
	@echo "DESTDIR = $(DESTDIR)"

.c.o:
	$(CC) -c $(CFLAGS) $<

moe: moe.o
	$(CC) -o $@ moe.o

clean:
	rm -f moe $(OBJ)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f moe $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/moe

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/moe

.PHONY: all option clean install uninstall
