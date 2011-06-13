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

## $Id: Makefile.am,v 1.9 2009/06/30 22:53:56 kes Exp $

## Process this file with automake to produce Makefile.in

AUTOMAKE_OPTIONS = foreign

noinst_PROGRAMS = test

check_PROGRAMS = test

TESTS = test

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

SIGPROC_DIR = $(srcdir)/../..
SIGPROC_INCDIR = $(SIGPROC_DIR)/include

<<<<<<< HEAD
SPECTRA_LIB_DIR =  $(builddir)/../src
=======
SPECTRA_LIB_DIR =  $(top_builddir)/src
>>>>>>> origin/gsoc
SPECTRA_LIB = $(SPECTRA_LIB_DIR)/libSpectra.a

SSE_INCDIR = $(srcdir)/../../../sse-pkg/include

PKT_DIR = $(srcdir)/../../ATApackets
PKT_INCDIR = $(PKT_DIR)/include
<<<<<<< HEAD
PKT_LIBDIR = $(builddir)/../../ATApackets/src
=======
PKT_LIBDIR = $(top_builddir)/../ATApackets/src
>>>>>>> origin/gsoc

LIB_DEPENDS = $(SPECTRA_LIB)

test_DEPENDENCIES = $(LIB_DEPENDS)

SPECTRAINCLUDE = ../include

INCLUDES= -I . -I$(SPECTRAINCLUDE) \
	-I$(srcdir)/../include \
	-I$(srcdir)/../lib \
	-I$(PKT_INCDIR) \
	-I$(SIGPROC_INCDIR) \
	-I$(SSE_INCDIR)

test_SOURCES = \
	test.cpp \
	SpectraTest.cpp \
	SpectraTest.h

SPECTRA_LIBS = \
  -lpthread -lnsl \
  ../src/libSpectra.a \
  -lfftw3f \
  -L$(PKT_LIBDIR) \
  -lSup

LDADD = $(SPECTRA_LIBS)
