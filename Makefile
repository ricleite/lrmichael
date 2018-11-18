
CC=gcc
CCX=g++
DFLAGS=-ggdb -g -fno-omit-frame-pointer
CFLAGS=-shared -fPIC -std=gnu11 -O2 -Wall $(DFLAGS)

# -mcx16 allows the compiler to assume the cpu supports
#  cmpxchg16b (e.g double cas) during execution
# assuming this support shouldn't be a problem, see:
# https://superuser.com/questions/187254/how-prevalent-are-old-x64-processors-lacking-the-cmpxchg16b-instruction
CXXFLAGS=-shared -fPIC -mcx16 -std=gnu++14 -O2 -Wall $(DFLAGS)

LDFLAGS=-ldl -pthread $(DFLAGS)

FILES=lrmichael.cpp size_classes.cpp pages.cpp pagemap.cpp

default: lrmichael.so lrmichael.a

lrmichael.so: $(FILES)
	$(CCX) $(LDFLAGS) $(CXXFLAGS) -o lrmichael.so $(FILES)

lrmichael.a: lrmichael.so
	ar rcs lrmichael.a lrmichael.so

clean:
	rm -f *.so *.o *.a
