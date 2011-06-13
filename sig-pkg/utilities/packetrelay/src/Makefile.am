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

## $Id: Makefile.am,v 1.5 2009/07/01 16:54:40 jane Exp $

## Process this file with automake to produce Makefile.in


AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = packetrelay

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

<<<<<<< HEAD
PACKETRELAY_LIB_DIR = $(builddir)/../lib
=======
PACKETRELAY_LIB_DIR = $(top_builddir)/lib
>>>>>>> origin/gsoc
PACKETRELAY_LIB = $(PACKETRELAY_LIB_DIR)/libDx.a

SIGPROC_DIR = $(srcdir)/../../..
SIGPROC_INCDIR = $(SIGPROC_DIR)/include

SSE_INCDIR = $(srcdir)/../../../../sse-pkg/include

SSE_INTERFACE_DIR = $(builddir)/../../../../sse-pkg/sseInterfaceLib
SSE_INTERFACE_INCDIR = $(srcdir)/../../../../sse-pkg/sseInterfaceLib

SSE_DX_INTERFACE_DIR = $(builddir)/../../../../sse-pkg//sseDxInterfaceLib
SSE_DX_INTERFACE_INCDIR = $(srcdir)/../../../../sse-pkg/sseDxInterfaceLib

SSE_UTIL_DIR = $(builddir)/../../../../sse-pkg/sseutil
SSE_UTIL_INCDIR = $(srcdir)/../../../../sse-pkg/sseutil
SSE_UTIL_LIB = $(SSE_UTIL_DIR)/libsseutil.a

# the following are packet headers
PKT_HDR_DIR = $(srcdir)/../../../ATApackets
PKT_HDR_INCDIR = $(PKT_HDR_DIR)/include
<<<<<<< HEAD
PKT_HDR_LIBDIR = $(builddir)/../../../ATApackets/src
=======
PKT_HDR_LIBDIR = $(top_builddir)/../../ATApackets/src
>>>>>>> origin/gsoc
PKT_LIB = $(PKT_HDR_LIBDIR)/libPkt.a

# SonATA library directories
SONATA_DIR = $(srcdir)/../../../sonataLib
SONATA_INCDIR = $(SONATA_DIR)/include
<<<<<<< HEAD
SONATA_LIBDIR = $(builddir)/../../../sonataLib/src
=======
SONATA_LIBDIR = $(top_builddir)/../../sonataLib/src
>>>>>>> origin/gsoc
SONATA_LIB = $(SONATA_LIBDIR)/libSonata.a

LIB_DEPENDS = $(PKT_LIB) $(SONATA_LIB)

packetrelay_DEPENDENCIES = $(LIB_DEPENDS)

PACKETRELAY_INCLUDE = $(srcdir)/../include

INCLUDES= -I$(PACKETRELAY_INCLUDE) -I$(PKT_HDR_INCDIR) \
	-I$(SONATA_INCDIR) -I$(SIGPROC_INCDIR) \
	-I$(SSE_INCDIR) -I$(SSE_DX_INTERFACE_INCDIR) \
	-I$(srcdir)/../include
	-I/usr/include/tcl8.3 -I/usr/include/tcl8.2 \
	-I$(srcdir)/../lib

PACKETRELAY_LIBS = \
  -lpthread -lnsl \
  -L$(SONATA_LIBDIR) \
  -L$(PKT_HDR_LIBDIR) \
  -lSonata \
  -lPkt -lSup \
  -lfftw3f -lrt

LDADD = $(PACKETRELAY_LIBS)

packetrelay_SOURCES = main.cpp \
	Args.cpp \
	PacketRelay.cpp \
	PrErrMsg.cpp \
	Relay.cpp
	
