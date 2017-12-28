CXX = g++
STRIP = strip

CXXFLAGS = -s -O2 -DSTANDALONE
INCLUDES = -Isrc/shared -Isrc/enet/include

OBJS = authgen.o \
	src/shared/crypto.o

default: $(OBJS) link

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $(subst .o,.cpp,$@) 

clean:
	rm -f $(OBJS) authgen

link:
	$(CXX)  $(OBJS) -o authgen
	$(STRIP) authgen
