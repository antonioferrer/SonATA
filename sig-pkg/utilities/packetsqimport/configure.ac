################################################################################
#
# File:    configure.ac
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

#AC_INIT
AC_CONFIG_SRCDIR([include/PacketSend.h])
AC_INIT([packetsqimport],[1.0])
AC_CONFIG_HEADERS([config.h])
#AC_PREREQ([2.68])dnl               dnl Minimum Autoconf version required.
AC_ARG_PROGRAM
AM_MAINTAINER_MODE
AC_CONFIG_SRCDIR([src/packetsqimport.cpp])
AM_INIT_AUTOMAKE([foreign])
#AM_INIT_AUTOMAKE(packetsend, 0.1)
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES])
AC_SUBST(CXXFLAGS,"-Wall -Woverloaded-virtual -D_REENTRANT $(DEBUGFLAGS) \
	-march=native -msse3 -fno-strict-aliasing")

# add an option to build debug version
AC_ARG_ENABLE(debug,
[	--enable-debug		build debug version], debug=$enableval, debug=no)
#[case "${enableval}" in
#	yes) debug=true;;
#	no) debug=false;;
#	*) AC_MSG_ERROR(bad value ${enableval} for --enable-debug);;
#esac],[debug=false])
if test "$debug" = "yes"; then	
	AC_SUBST(CXXFLAGS, "$CXXFLAGS -g -O0")
else
	AC_SUBST(CXXFLAGS, "$CXXFLAGS -O3")
fi

dnl Checks for programs.
AC_PROG_RANLIB
AC_PROG_INSTALL
AC_PROG_CC_STDC
AC_PROG_CPP
AC_PROG_CXX
AC_PROG_CXXCPP
AM_PROG_AS
AM_C_PROTOTYPES

dnl Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS(limits.h inttypes.h unistd.h)

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_CHECK_TYPES([int32_t, uint32_t, int8_t, uint8_t])

dnl Checks for library functions.
AC_FUNC_ALLOCA
AC_CHECK_LIB(socket,recvfrom)
AC_SEARCH_LIBS(Tcl_Init, tcl8.3 tcl8.2 tcl)

dnl checks for endian-ness
AC_C_BIGENDIAN

dnl initialize libtool
_LT_SET_OPTION([LT_INIT],[dlopen])
AC_DIAGNOSE([obsolete],[AC_LIBTOOL_DLOPEN: Remove this warning and the call to _LT_SET_OPTION when you
put the `dlopen' option into LT_INIT's first parameter.])

AC_DISABLE_SHARED
LT_INIT
AC_SUBST(LIBTOOL_DEPS)
dnl original_LIBS=$LIBS
dnl LIBS="-L/opt/intel/mkl/lib/32/ $LIBS -lguide"
dnl AC_CHECK_LIB(mkl_p4, cfft1d_)
dnl AC_CHECK_LIB(mkl_p4, cfft1d_, original_LIBS=$LIBS)
dnl LIBS=$original_LIBS
AC_CONFIG_FILES([Makefile
	  src/Makefile
	])
AC_OUTPUT
