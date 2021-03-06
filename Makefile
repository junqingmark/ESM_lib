# Makefile for genreating the ESM example program 
#
# $Id: Makefile,v 1.6 2005/04/27 17:18:00 sbenhima Exp $

CC = gcc

CXX = g++

CCFLAGS = -O3 -funroll-loops

CXXFLAGS = -Wall -O3
#CCFLAGS += -Wall 

INCDIR = -I./inc

SRCDIR = src

BINDIR = bin

RESDIR = res

LIBDIR = lib

RESDIR = res

LIBS = ESMlib.a

PROG = ESMexample 

TEST = aaa

CAM = cam

STDLIB = -lm

CXXFLAGS+= `pkg-config --cflags opencv`

OCVLIBS = `pkg-config --libs opencv`

LIBS := $(addprefix $(LIBDIR)/,$(LIBS))

all: example test cam

example: $(addprefix $(BINDIR)/,$(PROG))

test: $(addprefix $(BINDIR)/,$(TEST))

cam: $(addprefix $(BINDIR)/,$(CAM))

$(BINDIR)/%: $(SRCDIR)/%.cpp $(LIBS) 
	@if test ! -d $(BINDIR); then mkdir $(BINDIR); fi
	@if test ! -d $(RESDIR); then mkdir $(RESDIR); fi
	$(CXX) $(CXXFLAGS) -o $@ $(INCDIR) $< $(LIBS) $(STDLIB)
	
$(BINDIR)/%: $(SRCDIR)/%.cpp $(LIBS) 
	@if test ! -d $(BINDIR); then mkdir $(BINDIR); fi
	@if test ! -d $(RESDIR); then mkdir $(RESDIR); fi
	$(CXX) $(CXXFLAGS) -o $@ $(INCDIR) $< $(LIBS) $(OCVLIBS) $(STDLIB)


clean: 
	rm -rf $(BINDIR) $(RESDIR)
	
	
