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

## $Id: Makefile.am,v 1.6 2009/06/30 22:54:37 kes Exp $

## Process this file with automake to produce Makefile.in


AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = packetread

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

SIGPROC_DIR = $(srcdir)/../../..
SIGPROC_INCDIR = $(SIGPROC_DIR)/include

SSE_INCDIR = $(srcdir)/../../../../sse-pkg/include

SSE_INTERFACE_DIR = $(builddir)/../../../../sse-pkg/sseInterfaceLib
SSE_INTERFACE_INCDIR = $(srcdir)/../../../../sse-pkg/sseInterfaceLib
SSE_INTERFACE_LIBDIR = $(SSE_INTERFACE_DIR)
SSE_INTERFACE_LIB = $(SSE_INTERFACE_DIR)/libsseInterface.a

SSE_DX_INTERFACE_DIR = $(builddir)/../../../../sse-pkg/sseDxInterfaceLib
SSE_DX_INTERFACE_INCDIR = $(srcdir)/../../../../sse-pkg/sseDxInterfaceLib
SSE_DX_INTERFACE_LIBDIR = $(SSE_DX_INTERFACE_DIR)
SSE_DX_INTERFACE_LIB = $(SSE_DX_INTERFACE_LIBDIR)/libsseDxInterface.a

# the following are packet headers
PKT_HDR_DIR = $(srcdir)/../../../ATApackets
PKT_HDR_INCDIR = $(PKT_HDR_DIR)/include
PKT_HDR_LIBDIR = $(builddir)/../../../ATApackets/src
PKT_LIB = $(PKT_HDR_LIBDIR)/libPkt.a

# SonATA library directories
SONATA_DIR = $(srcdir)/../../../sonataLib
SONATA_INCDIR = $(SONATA_DIR)/include
SONATA_LIBDIR = $(builddir)/../../../sonataLib/src
SONATA_LIB = $(SONATA_LIBDIR)/libSonata.a

# Gaussian library directories
GAUSS_DIR = $(srcdir)/../../../gaussLib
GAUSS_INCDIR = $(GAUSS_DIR)/include
GAUSS_LIBDIR = $(builddir)/../../../gaussLib/src
GAUSS_LIB = $(GAUSS_LIBDIR)/libGauss.a

LIB_DEPENDS = $(PKT_LIB) $(SONATA_LIB) $(GAUSS_LIB) \
		$(SSE_INTERFACE_LIB) $(SSE_DX_INTERFACE_LIB)

packetread_DEPENDENCIES = $(LIB_DEPENDS)

packetread_INCLUDE = $(srcdir)/../include

INCLUDES= -I$(packetread_INCLUDE) -I$(PKT_HDR_INCDIR) -I$(GAUSS_INCDIR) \
	-I$(SONATA_INCDIR) -I$(SIGPROC_INCDIR) \
	-I$(SSE_INCDIR) -I$(SSE_INTERFACE_INCDIR) \
	-I$(SSE_DX_INTERFACE_INCDIR) -I$(srcdir)/../include \
	-I/usr/include/tcl8.3 -I/usr/include/tcl8.2 \
	-I$(srcdir)/../lib

PACKETREAD_LIBS = \
  -lpthread -lnsl \
  -L$(PKT_HDR_LIBDIR) \
  -L$(GAUSS_LIBDIR) \
  -L$(SONATA_LIBDIR) \
  -L$(SSE_DX_INTERFACE_LIBDIR) \
  -L$(SSE_INTERFACE_LIBDIR) \
  -lPkt -lSup \
  -lGauss \
  -lSonata \
  -lsseDxInterface \
  -lsseInterface \
  -lfftw3f -lrt

LDADD = $(PACKETREAD_LIBS)

packetread_SOURCES = \
	SseTimer.cpp \
	packetread.cpp
