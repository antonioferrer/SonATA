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

## $Id: Makefile.am,v 1.8 2009/06/30 22:51:55 kes Exp $

## Process this file with automake to produce Makefile.in


AUTOMAKE_OPTIONS = foreign

noinst_PROGRAMS = test

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

DX_INCDIR = $(srcdir)/../include
DX_SRCINCDIR = $(srcdir)/../src
DX_LIBDIR = $(builddir)/../lib
DX_LIB = $(DX_LIBDIR)/libDx.a

SIGPROC_DIR = $(srcdir)/../..
SIGPROC_INCDIR = $(SIGPROC_DIR)/include

# Gaussian library directories
GAUSS_DIR = $(srcdir)/../../gaussLib
GAUSS_INCDIR = $(GAUSS_DIR)/include
GAUSS_LIBDIR = $(builddir)/../../gaussLib/src
GAUSS_LIB = $(GAUSS_LIBDIR)/libGauss.a

# SonATA library directories
SONATA_DIR = $(srcdir)/../../sonataLib
SONATA_INCDIR = $(SONATA_DIR)/include
SONATA_LIBDIR = $(builddir)/../../sonataLib/src
SONATA_LIB = $(SONATA_LIBDIR)/libSonata.a

SSE_INCDIR = $(srcdir)/../../../sse-pkg/include

SSE_INTERFACE_DIR = $(builddir)/../../../sse-pkg/sseInterfaceLib
SSE_INTERFACE_INCDIR = $(srcdir)/../../../sse-pkg/sseInterfaceLib
SSE_INTERFACE_LIB = $(SSE_INTERFACE_DIR)/libsseInterface.a

SSE_DX_INTERFACE_DIR = $(builddir)/../../../sse-pkg//sseDxInterfaceLib
SSE_DX_INTERFACE_INCDIR = $(srcdir)/../../../sse-pkg/sseDxInterfaceLib
SSE_DX_INTERFACE_LIB = $(SSE_DX_INTERFACE_DIR)/libsseDxInterface.a

SSE_UTIL_DIR = $(builddir)/../../../sse-pkg/sseutil
SSE_UTIL_INCDIR = $(srcdir)/../../../sse-pkg/sseutil
SSE_UTIL_LIB = $(SSE_UTIL_DIR)/libsseutil.a

# DFB library directories
DFB_DIR = $(srcdir)/../../dfbLib
DFB_INCDIR = $(DFB_DIR)/include
DFB_LIBDIR = $(builddir)/../../dfbLib/src
DFB_LIB = $(DFB_LIBDIR)/libDfb.a

# the following are packet headers
PKT_DIR = $(srcdir)/../../ATApackets
PKT_INCDIR = $(PKT_DIR)/include
PKT_LIBDIR = $(builddir)/../../ATApackets/src

# spectra library
SPECTRA_DIR = $(srcdir)/../../spectraLib
SPECTRA_INCDIR = $(SPECTRA_DIR)/include
SPECTRA_LIBDIR = $(builddir)/../../spectraLib/src
SPECTRA_LIB = $(SPECTRA_LIBDIR)/libSpectra.a

# DADD library
DADD_DIR = $(srcdir)/../../daddLib
DADD_INCDIR = $(DADD_DIR)/include
DADD_LIBDIR = $(builddir)/../../daddLib/src
DADD_LIB = $(DADD_LIBDIR)/libDadd.a

LIB_DEPENDS = $(DX_LIB) $(SONATA_LIB) $(SPECTRA_LIB) $(DADD_LIB) $(GAUSS_LIB) \
		$(SSE_INTERFACE_LIB) $(SSE_DX_INTERFACE_LIB) \
		$(SSE_UTIL_LIB) $(DFB_LIB)

test_DEPENDENCIES = $(LIB_DEPENDS)

DX_INCLUDE = $(srcdir)/../include
CPPUNIT_ROOT=/usr/local/CppUnit

INCLUDES= -I$(DX_INCDIR) -I$(DX_SRCINCDIR) -I$(SONATA_INCDIR) \
	-I$(PKT_INCDIR) -I$(SIGPROC_INCDIR) \
	-I$(SPECTRA_INCDIR) -I$(DFB_INCDIR) -I$(DADD_INCDIR) -I$(GAUSS_INCDIR) \
	-I$(SSE_INCDIR) -I$(SSE_INTERFACE_INCDIR) -I$(SSE_DX_INTERFACE_INCDIR) \
	-I$(SSE_UTIL_DIR) \
	-I$(CPPUNIT_ROOT)/include -I$(srcdir)/../include \
	-I/usr/include/tcl8.3 -I/usr/include/tcl8.2 \
	-I$(srcdir)/../lib

TEST_LIBS = \
  -lpthread -lnsl \
  $(DX_LIB) \
  -L$(DFB_LIBDIR) \
  -L$(SPECTRA_LIBDIR) \
  -L$(DADD_LIBDIR) \
  -L$(GAUSS_LIBDIR) \
  -L$(SONATA_LIBDIR) \
  -L$(SSE_DX_INTERFACE_DIR) \
  -L$(SSE_INTERFACE_DIR) \
  -L$(SSE_UTIL_DIR) \
  -L$(PKT_LIBDIR) \
  -lPkt -lSup \
  -lDfb \
  -lSpectra \
  -lDadd \
  -lGauss \
  -lSonata \
  -lsseDxInterface \
  -lsseInterface \
  -lsseutil \
  -lfftw3f

LDADD = $(TEST_LIBS)

test_SOURCES = \
			test.cpp
