SRCS = StRoot/IClasses/IEvent.cxx StRoot/IClasses/IEventPlane.cxx StRoot/ConfigReader/ConfigReader.cxx TreeAnalyzer.cxx
OBJS = $(SRCS:.cxx=.o)
DEPS = StRoot/IClasses/IEventPlane.h StRoot/IClasses/IEvent.h FlowUtils.h
TARGET = TreeAnalyzer
#TARGET2 = testPurity

ROOTCFLAGS    = $(shell root-config --cflags)
ROOTLIBS      = $(shell root-config --libs)
ROOTGLIBS     = $(shell root-config --glibs)
ROOTLIBS     += -lEG

#INCFLAGS = -I$(ROOTSYS)/include -I/afs/rhic.bnl.gov/star/packages/SL19b/StRoot -I/afs/rhic.bnl.gov/star/packages/SL19b/StRoot/StPicoEvent -I/afs/rhic.bnl.gov/star/packages/SL19b/StRoot/StEpdUtil
INCFLAGS = -I$(ROOTSYS)/include -I./ -I./StRoot -I./StRoot/StEvent -I./StRoot/StBichsel -I./StRoot/IClasses 
#LIBFLAGS = -L$(ROOTSYS)/lib -L./ -L./libs -Wl,-R./libs
LIBFLAGS = -L$(ROOTSYS)/lib -L./ -L./libs -L./StRoot/IClasses -Wl,-R./libs 
SOLIBS = -lStPicoDst -lStEpdUtil -lStBichsel 
#for each non-standard dynamic library location -L a corresponding -Wl,-R should be specified
#the -L's to StPicoEvent, StEpdUtil, and StBichsel are for locating libStPicoEvent.so, libStEpdUtil.so, and libStBichsel.so
#the -l's are to link these .so files

#-L./StRoot/StPicoEvent -Wl,-R./StRoot/StPicoEvent -L./StRoot/StEpdUtil -Wl,-R./StRoot/StEpdUtil

CC = g++ #-m32
FLAGS = -Wall -g -fPIC

COMPILE = $(CC) $(FLAGS)


all: $(TARGET) #$(TARGET2)

$(TARGET): $(OBJS)
	$(COMPILE) -o $@ $^ $(SOLIBS) $(ROOTCFLAGS) $(ROOTLIBS) $(INCFLAGS) $(LIBFLAGS)

#$(TARGET2): testPurity.o
#	$(COMPILE) -o $@ $^ $(SOLIBS) $(ROOTCFLAGS) $(ROOTLIBS) $(INCFLAGS) $(LIBFLAGS)

StRoot/IClasses/IEvent.o: StRoot/IClasses/IEvent.h StRoot/IClasses/IEvent.cxx
	$(COMPILE) -o $@ -c StRoot/IClasses/IEvent.cxx $(ROOTCFLAGS) $(ROOTLIBS)

StRoot/IClasses/IEventPlane.o: StRoot/IClasses/IEventPlane.h StRoot/IClasses/IEventPlane.cxx
	$(COMPILE) -o $@ -c StRoot/IClasses/IEventPlane.cxx $(ROOTCFLAGS) $(ROOTLIBS)

TreeAnalyzer.o: FlowUtils.h  StRoot/ConfigReader/ConfigReader.h StRoot/IClasses/IEvent.h  StRoot/IClasses/IEventPlane.h TreeAnalyzer.cxx
#TreeAnalyzer.o: FlowUtils.h StRoot/ConfigReader/ConfigReader.h TreeAnalyzer.cxx
	$(COMPILE) -o $@ -c TreeAnalyzer.cxx -lStPicoDst -lStEpdUtil -lStBichsel $(ROOTCFLAGS) $(ROOTLIBS) $(INCFLAGS) $(LIBFLAGS)
	#$(COMPILE) -o $@ -c TreeAnalyzer.cxx $(SOLIBS) $(ROOTCFLAGS) $(ROOTLIBS) $(INCFLAGS) $(LIBFLAGS)

StRoot/ConfigReader/ConfigReader.o: StRoot/ConfigReader/ConfigReader.h StRoot/ConfigReader/ConfigReader.cxx
	$(COMPILE) -o $@ -c StRoot/ConfigReader/ConfigReader.cxx $(ROOTCFLAGS) $(ROOTLIBS)

testPurity.o: testPurity.cxx
	$(COMPILE) -o $@ -c testPurity.cxx $(SOLIBS) $(ROOTCFLAGS) $(ROOTLIBS) $(INCFLAGS) $(LIBFLAGS)

.PHONY: clean

clean:
	rm -f $(TARGET) $(OBJS) #testPurity.o testPurity



# target : dependencies
#	action

# $@ = current target
# $^ = current dependencies
# $< = name of the related file that caused the action
