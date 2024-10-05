CC= gcc209
CCFLAGS= -D_BSD_SOURCE -D_GNU_SOURCE

all:ish
clobber: clean
	rm -f *~ \#*\# core
clean:
	rm -f ish *.o

ish: dynarray.o ish.o
	$(CC) $(CCFLAGS) dynarray.o ish.o -o ish

dynarray.o: dynarray.c dynarray.h
	$(CC) $(CCFLAGS) -c dynarray.c

ish.o: ish.c dynarray.h
	$(CC) $(CCFLAGS) -c ish.c
