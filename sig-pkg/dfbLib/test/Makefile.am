################################################################################
#
# File:    Makefile.am
# Project: OpenSonATA
# Authors: The OpenSonATA code is the result of many programmers
#          over many years
#
# Copyright 2011 The SETI Institute
#
# OpenSonATA is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# OpenSonATA is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with OpenSonATA.  If not, see<http://www.gnu.org/licenses/>.
# 
# Implementers of this code are requested to include the caption
# "Licensed through SETI" with a link to setiQuest.org.
# 
# For alternate licensing arrangements, please contact
# The SETI Institute at www.seti.org or setiquest.org. 
#
################################################################################

## $Id: Makefile.am,v 1.10 2009/06/30 19:06:37 kes Exp $

## Process this file with automake to produce Makefile.in


AUTOMAKE_OPTIONS = foreign

noinst_PROGRAMS = test

check_PROGRAMS = test

TESTS = test

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

<<<<<<< HEAD
DFB_LIB_DIR = $(builddir)/../src
=======
DFB_LIB_DIR = $(top_builddir)/src
>>>>>>> origin/gsoc
DFB_LIB = $(DFB_LIB_DIR)/libDfb.a

SIGPROC_DIR = $(srcdir)/../..
SIGPROC_INCDIR = $(SIGPROC_INCDIR)/include

PKT_DIR = $(srcdir)/../../ATApackets
PKT_INCDIR = $(PKT_DIR)/include
PKT_LIBDIR = $(PKT_DIR)/src

LIB_DEPENDS = $(DFB_LIB)

test_DEPENDENCIES = $(LIB_DEPENDS)

<<<<<<< HEAD
DFBINCLUDE = $(srcdir)/../include
=======
DFBINCLUDE = $(top_srcdir)/include
>>>>>>> origin/gsoc

INCLUDES= -I . -I$(DFBINCLUDE) -I$(PKT_INCDIR) \
	-I$(srcdir)/../include \
	-I$(srcdir)/../lib

test_SOURCES = \
	test.cpp \
	DfbTest.cpp \
	DfbTest.h \
	TestFilter.cpp \
	testVal.h

DFB_LIBS = \
  -lpthread -lnsl \
<<<<<<< HEAD
   $(builddir)/../src/libDfb.a \
  -lfftw3f \
   $(builddir)/../../ATApackets/src/libSup.a
=======
   $(top_builddir)/src/libDfb.a \
  -lfftw3f \
   $(top_builddir)/../ATApackets/src/libSup.a
>>>>>>> origin/gsoc

LDADD = $(DFB_LIBS)
