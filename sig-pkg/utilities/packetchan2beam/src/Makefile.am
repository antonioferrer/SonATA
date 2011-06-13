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

## $Id: Makefile.am,v 1.5 2009/07/01 16:56:52 jane Exp $

## Process this file with automake to produce Makefile.in


AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = packetchan2beam

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

<<<<<<< HEAD
PACKETSQIMPORT_LIB_DIR = $(builddir)/../lib
=======
PACKETSQIMPORT_LIB_DIR = $(top_builddir)/lib
>>>>>>> origin/gsoc
PACKETSQIMPORT_LIB = $(PACKETSQIMPORT_LIB_DIR)/libDx.a

SIGPROC_DIR = $(srcdir)/../../..
SIGPROC_INCDIR = $(SIGPROC_DIR)/include

SSE_INCDIR = $(srcdir)/../../../../sse-pkg/include

SSE_INTERFACE_DIR = $(builddir)/../../../../sse-pkg/sseInterfaceLib
SSE_INTERFACE_INCDIR = $(srcdir)/../../../../sse-pkg/sseInterfaceLib

SSE_DX_INTERFACE_DIR = $(builddir)/../../../../sse-pkg//sseDxInterfaceLib
SSE_DX_INTERFACE_INCDIR = $(srcdir)/../../../../sse-pkg/sseDxInterfaceLib

# the following are packet headers
PKT_HDR_DIR = $(srcdir)/../../../ATApackets
PKT_HDR_INCDIR = $(PKT_HDR_DIR)/include
<<<<<<< HEAD
PKT_HDR_LIBDIR = $(builddir)/../../../ATApackets/src
=======
PKT_HDR_LIBDIR = $(top_builddir)/../../ATApackets/src
>>>>>>> origin/gsoc
PKT_LIB = $(PKT_HDR_LIBDIR)/libPkt.a
SUP_LIB = $(PKT_HDR_LIBDIR)/libSup.a

LIB_DEPENDS = $(PKT_LIB) $(SUP_LIB)

packetchan2beam_DEPENDENCIES = $(LIB_DEPENDS)

PACKETSQIMPORT_INCLUDE = $(srcdir)/../include

INCLUDES= -I$(PACKETSQIMPORT_INCLUDE) -I$(PKT_HDR_INCDIR) \
	-I$(srcdir)/../include \
	-I$(srcdir)/../lib

PACKETSQIMPORT_LIBS = \
  -lpthread -lnsl \
  -L$(PKT_HDR_LIBDIR) -lPkt -lSup

LDADD = $(PACKETSQIMPORT_LIBS)

packetchan2beam_SOURCES = packetchan2beam.cpp 
