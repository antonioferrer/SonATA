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

## $Id: Makefile.am,v 1.18 2009/07/12 18:40:52 kes Exp $

## Process this file with automake to produce Makefile.in

AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = dx

EXTRA_PROGRAMS =

EXTRA_DIST =

BUILT_SOURCES =

<<<<<<< HEAD
DX_INCDIR = $(srcdir)/../include
DX_LIBDIR = $(builddir)/../lib
=======
DX_INCDIR = $(top_srcdir)/include
DX_LIBDIR = $(top_builddir)/lib
>>>>>>> origin/gsoc
DX_LIB = $(DX_LIBDIR)/libDx.a

SIGPROC_DIR = $(srcdir)/../..
SIGPROC_INCDIR = $(SIGPROC_DIR)/include

# SonATA library directories
SONATA_DIR = $(srcdir)/../../sonataLib
SONATA_INCDIR = $(SONATA_DIR)/include
<<<<<<< HEAD
SONATA_LIBDIR = $(builddir)/../../sonataLib/src
=======
SONATA_LIBDIR = $(top_builddir)/../sonataLib/src
>>>>>>> origin/gsoc
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
<<<<<<< HEAD
DFB_LIBDIR = $(builddir)/../../dfbLib/src
=======
DFB_LIBDIR = $(top_builddir)/../dfbLib/src
>>>>>>> origin/gsoc
DFB_LIB = $(DFB_LIBDIR)/libDfb.a

# the following are packet headers
PKT_DIR = $(srcdir)/../../ATApackets
PKT_INCDIR = $(PKT_DIR)/include
<<<<<<< HEAD
PKT_LIBDIR = $(builddir)/../../ATApackets/src
=======
PKT_LIBDIR = $(top_builddir)/../ATApackets/src
>>>>>>> origin/gsoc

# spectra library
SPECTRA_DIR = $(srcdir)/../../spectraLib
SPECTRA_INCDIR = $(SPECTRA_DIR)/include
<<<<<<< HEAD
SPECTRA_LIBDIR = $(builddir)/../../spectraLib/src
=======
SPECTRA_LIBDIR = $(top_builddir)/../spectraLib/src
>>>>>>> origin/gsoc
SPECTRA_LIB = $(SPECTRA_LIBDIR)/libSpectra.a

# DADD library
DADD_DIR = $(srcdir)/../../daddLib
DADD_INCDIR = $(DADD_DIR)/include
<<<<<<< HEAD
DADD_LIBDIR = $(builddir)/../../daddLib/src
=======
DADD_LIBDIR = $(top_builddir)/../daddLib/src
>>>>>>> origin/gsoc
DADD_LIB = $(DADD_LIBDIR)/libDadd.a

LIB_DEPENDS = $(DX_LIB) $(SONATA_LIB) $(SPECTRA_LIB) $(DADD_LIB) \
		$(SSE_INTERFACE_LIB) $(SSE_DX_INTERFACE_LIB) \
		$(SSE_UTIL_LIB) $(DFB_LIB)

dx_DEPENDENCIES = $(LIB_DEPENDS)

DX_INCLUDE = $(srcdir)/../include
CPPUNIT_ROOT=/usr/local/CppUnit

INCLUDES= -I$(DX_INCDIR) -I$(SONATA_INCDIR) -I$(PKT_INCDIR) \
	-I$(SPECTRA_INCDIR) -I$(DFB_INCDIR) -I$(DADD_INCDIR) -I$(SIGPROC_INCDIR) \
	-I$(SSE_INCDIR) -I$(SSE_INTERFACE_INCDIR) \
	-I$(SSE_DX_INTERFACE_INCDIR) -I$(SSE_UTIL_DIR) \
	-I$(CPPUNIT_ROOT)/include -I$(srcdir)/../include \
	-I/usr/include/tcl8.3 -I/usr/include/tcl8.2 \
	-I$(srcdir)/../lib

DX_LIBS = \
  $(IFFT_LINK_OPTIONS) \
  -lpthread -lnsl \
  $(DX_LIB) \
  $(SONATA_LIB) \
  -L$(DFB_LIBDIR) \
  -L$(SPECTRA_LIBDIR) \
  -L$(DADD_LIBDIR) \
  -L$(SSE_DX_INTERFACE_DIR) \
  -L$(SSE_INTERFACE_DIR) \
  -L$(SSE_UTIL_DIR) \
  -L$(PKT_LIBDIR) \
  -lPkt -lSup \
  -lDfb \
  -lSpectra \
  -lDadd \
  -lsseDxInterface \
  -lsseInterface \
  -lsseutil \
  -lfftw3f

LDADD = $(DX_LIBS)

dx_SOURCES = \
			ArchiverCmdTask.cpp \
			ArchiverCmdTask.h \
			ArchiverConnectionTask.cpp \
			ArchiverConnectionTask.h \
			ArchiverInputTask.cpp \
			ArchiverInputTask.h \
			ArchiverOutputTask.cpp \
			ArchiverOutputTask.h \
			ArchiveTask.cpp \
			ArchiveTask.h \
			CmdTask.cpp \
			CmdTask.h \
			CollectionTask.cpp \
			CollectionTask.h \
			ConfirmationChannel.cpp \
			ConfirmationChannel.h \
			ConfirmationTask.cpp \
			ConfirmationTask.h \
			ControlTask.cpp \
			ControlTask.h \
			CwConfirmationChannel.cpp \
			CwConfirmationChannel.h \
			CwConfirmationTask.cpp \
			CwConfirmationTask.h \
			CwTask.cpp \
			CwTask.h \
			CwUnpacker.cpp \
			CwUnpacker.h \
			dedrift.cpp \
			dedrift.h \
			DetectionTask.cpp \
			DetectionTask.h \
			Dx.cpp \
			Dx.h \
			InputTask.cpp \
			InputTask.h \
			main.cpp \
			PulseConfirmationChannel.cpp \
			PulseConfirmationChannel.h \
			PulseConfirmationTask.cpp \
			PulseConfirmationTask.h \
			PulseTask.cpp \
			PulseTask.h \
			ReceiverTask.cpp \
			ReceiverTask.h \
			ScienceData.cpp \
			SignalClassifier.cpp \
			SignalClassifier.h \
			Spectrometer.cpp \
			Spectrometer.h \
			SseConnectionTask.cpp \
			SseConnectionTask.h \
			SseInputTask.cpp \
			SseInputTask.h \
			SseOutputTask.cpp \
			SseOutputTask.h \
			WorkerTask.cpp \
			WorkerTask.h 

noinst_HEADERS = \
			ArchiverCmdTask.h \
			ArchiverConnectionTask.h \
			ArchiverInputTask.h \
			ArchiverOutputTask.h \
			ArchiveTask.h \
			CmdTask.h \
			CollectionTask.h \
			ConfirmationChannel.h \
			ConfirmationTask.h \
			ControlTask.h \
			CwConfirmationChannel.h \
			CwConfirmationTask.h \
			CwTask.h \
			CwUnpacker.h \
			dedrift.h \
			DetectionTask.h \
			Dx.h \
			PulseConfirmationChannel.h \
			PulseConfirmationTask.h \
			PulseTask.h \
			ReceiverTask.h \
			SignalClassifier.h \
			Spectrometer.h \
			SseConnectionTask.h \
			SseInputTask.h \
			SseOutputTask.h \
			WorkerTask.h

# public headers to include in 'make install' target
#include_HEADERS = $(noinst_HEADERS)
