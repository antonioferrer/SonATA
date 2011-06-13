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

## $Id: Makefile.am,v 1.4 2009/06/30 22:48:49 kes Exp $

## Process this file with automake to produce Makefile.in



AUTOMAKE_OPTIONS = foreign

check_PROGRAMS = pktTest

noinst_PROGRAMS = pktTest

TESTS = pktTest

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

<<<<<<< HEAD
PKT_DIR = $(builddir)/../src
PKT_INCDIR = $(builddir)/../include
PKT_LIBDIR = $(PKT_DIR)
PKT_LIB = $(PKT_LIBDIR)/libPkt.a

SUP_DIR = $(builddir)/../src
SUP_INCDIR = $(builddir)/../include
=======
PKT_DIR = $(top_builddir)/src
PKT_INCDIR = $(top_builddir)/include
PKT_LIBDIR = $(PKT_DIR)
PKT_LIB = $(PKT_LIBDIR)/libPkt.a

SUP_DIR = $(top_builddir)/src
SUP_INCDIR = $(top_builddir)/include
>>>>>>> origin/gsoc
SUP_LIBDIR = $(SUP_DIR)
SUP_LIB = $(SUP_LIBDIR)/libSup.a

LIB_DEPENDS = $(PKT_LIB) $(SUP_LIB)

pktTest_DEPENDENCIES = $(LIB_DEPENDS)

INCLUDES= -I . -I$(PKT_INCDIR) -I$(SUP_INCDIR) \
	-I$(srcdir)/../include \
	-I$(srcdir)/../lib

pktTest_SOURCES = \
	pktTest.cpp

TEST_LIBS = \
  -lpthread -lnsl \
   $(PKT_LIB)\
   $(SUP_LIB) \
  -lfftw3f

LDADD = $(TEST_LIBS)
