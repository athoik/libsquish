
include config

SRC = alpha.cpp clusterfit.cpp colourblock.cpp colourfit.cpp colourset.cpp maths.cpp rangefit.cpp singlecolourfit.cpp squish.cpp

OBJ = $(SRC:%.cpp=%.o)

LIB = libsquish.a

all : $(LIB) squish.pc

install : $(LIB) squish.pc
	install squish.h $(INSTALL_DIR)/include 
	install libsquish.a $(INSTALL_DIR)$(base_libdir)
	install squish.pc $(INSTALL_DIR)$(base_libdir)/pkgconfig

uninstall:
	$(RM) $(INSTALL_DIR)/include/squish.h
	$(RM) $(INSTALL_DIR)$(base_libdir)/libsquish.a

$(LIB) : $(OBJ)
	$(AR) cr $@ $?
	ranlib $@

%.o : %.cpp
	$(CXX) $(CPPFLAGS) -I. $(CXXFLAGS) -o$@ -c $<

clean :
	$(RM) $(OBJ) $(LIB)

squish.pc:
	sed 's|@PREFIX@|$(PREFIX)|' $@.in > $@

