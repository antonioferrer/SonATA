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
AC_INIT(SonATA-sse, 1.0)
AC_CONFIG_SRCDIR([include/sseInterface.h])
AC_CONFIG_HEADERS([config.h])
AC_PREFIX_DEFAULT($HOME/sonata_install)
AC_PREREQ([2.68])dnl               dnl Minimum Autoconf version required.
AC_ARG_PROGRAM
AM_MAINTAINER_MODE
AM_INIT_AUTOMAKE([foreign])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES])

# add an option to only build the dx libraries
AC_ARG_ENABLE(dxlibsonly,
[  --enable-dxlibsonly   Only make dx libraries],
[case "${enableval}" in
  yes) dxlibsonly=true ;;
  no)  dxlibsonly=false ;;
  *) AC_MSG_ERROR(bad value ${enableval} for --enable-dxlibsonly) ;;
esac],[dxlibsonly=false])
AM_CONDITIONAL(DX_LIBS_ONLY, test x$dxlibsonly = xtrue)

dnl Checks for programs.
AC_PROG_INSTALL
AC_PROG_CC
AC_PROG_CC_STDC
AC_PROG_CPP
AC_PROG_CXX
AC_PROG_CXXCPP
AC_PROG_RANLIB
AM_C_PROTOTYPES


  # copied from `configure.in' of `libiberty'
  vars="program_invocation_short_name program_invocation_name"
  for v in $vars; do
    AC_MSG_CHECKING([for $v])
    AC_CACHE_VAL(gnome_cv_var_$v,
      [AC_LINK_IFELSE([AC_LANG_PROGRAM([[int *p;]], [[extern int $v; p = &$v;]])],[eval "gnome_cv_var_$v=yes"],[eval "gnome_cv_var_$v=no"])])
    if eval "test \"`echo '$gnome_cv_var_'$v`\" = yes"; then
      AC_MSG_RESULT(yes)
      n=HAVE_`echo $v | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
      AC_DEFINE_UNQUOTED($n)
    else
      AC_MSG_RESULT(no)
    fi
  done

dnl Checks for header files.
AC_HEADER_STDC
AC_HEADER_TIME
AC_CHECK_HEADERS([arpa/inet.h fcntl.h float.h inttypes.h limits.h netdb.h netinet/in.h stdlib.h string.h strings.h sys/file.h sys/ioctl.h sys/socket.h sys/statfs.h sys/statvfs.h sys/time.h unistd.h utime.h])


dnl Checks for typedefs, structures, and compiler characteristics.

AC_C_CONST
AC_CHECK_TYPES([int32_t, uint32_t, int8_t, uint8_t])

ACX_PTHREAD()
LIBS="$PTHREAD_LIBS $LIBS"
CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
CXXFLAGS="$CXXFLAGS $PTHREAD_CFLAGS -Wall -Woverloaded-virtual -fno-default-inline"
CC="$PTHREAD_CC"

# Define CPPUNIT_ROOT for the Makefiles.

if test -d /usr/local/CppUnit ; then
	CPPUNIT_ROOT=/usr/local/CppUnit
fi

dnl checks for mysql libraries
AC_CHECK_LIB([mysqlclient], [main])
AC_CHECK_LIB([mysqlclient_r], [main])

AC_FUNC_ALLOCA
dnl AC_CHECK_LIB(pthread,pthread_cond_timedwait)
AC_CHECK_LIB(socket,recvfrom)
AC_CHECK_LIB(nsl, gethostbyname)

AC_SEARCH_LIBS(Tcl_Init, tcl8.6 tcl8.5 tcl8.4 tcl8.3 tcl8.2 tcl)
AC_SEARCH_LIBS(endwin, ncurses)

#tk is no longer used
#AC_SEARCH_LIBS(Tk_CreateWindow, tk8.3 tk8.2 tk)

dnl These are the prerequisite macros for GNU's error.c file.
AC_CHECK_FUNCS(strerror strerror_r vprintf doprnt)

AC_CHECK_FUNCS(fputs_unlocked fwrite_unlocked)
AC_FUNC_STRERROR_R
AC_FUNC_REALLOC
AC_FUNC_MALLOC
AC_FUNC_ALLOCA
AC_REPLACE_FUNCS(gethostname)


dnl Checks for gpib library functions.

AH_TEMPLATE([HAVE_LIBGPIB],
[ Define if you have the `gpib' library (-lgpib).])


if test -d /usr/local/NI_GPIB_ENET; then

  ac_save_LDFLAGS=$LDFLAGS

  LDFLAGS="$LDFLAGS -L/usr/local/NI_GPIB_ENET"

  AC_CHECK_LIB(gpib, Send, 
  [
    AC_DEFINE([HAVE_LIBGPIB]) 
    GPIB_INCLUDES="-I/usr/local/NI_GPIB_ENET $CXXFLAGS"
    GPIB_LDFLAGS="$LDFLAGS"

dnl    GPIB_LIBS="-lgpib $LIBS"
dnl use the static version of the library
    GPIB_LIBS="/usr/local/NI_GPIB_ENET/libgpib.a"
  ])

  LDFLAGS=$ac_save_LDFLAGS

fi

AC_SUBST(GPIB_INCLUDES)
AC_SUBST(GPIB_LDFLAGS)
AC_SUBST(GPIB_LIBS)



dnl Checks for stx driver
AH_TEMPLATE([HAVE_STX],
[ Define if you have the `stx' driver (/dev/stx0).])
if test -w /dev/stx0 ; then
	AC_DEFINE([HAVE_STX])
fi




dnl checks for endian-ness
AC_C_BIGENDIAN


dnl initialize libtool
_LT_SET_OPTION([LT_INIT],[dlopen])
AC_DIAGNOSE([obsolete],[AC_LIBTOOL_DLOPEN: Remove this warning and the call to _LT_SET_OPTION when you
put the `dlopen' option into LT_INIT's first parameter.])

dnl AC_DISABLE_SHARED
LT_INIT
AC_SUBST(LIBTOOL_DEPS)

dnl AC_CONFIG_SUBDIRS(libpqxx)



# For safe gcc multithreading, you need to set this flag:
# solaris
# CPPFLAGS="-pthreads $CPPFLAGS"
# linux
# CPPFLAGS="-pthread $CPPFLAGS"


# Define the default ACE_ROOT for the Makefiles.
ACE_ROOT="$ACE_ROOT"

# build with stlport for debugging
AC_ARG_WITH(stlport, [  --with-stlport          use the stlport library])
if test "x$with_stlport" = xyes; then

  # The user explicitly enabled STLPORT.

  # Note: If the sse-pkg was compiled with stlport, using -D_STLP_DEBUG, 
  # then the version of CPPUNIT needs to have been also.

  AC_SUBST(CPPUNIT_ROOT, /usr/local/CppUnitStlPort-gcc3.3)
  AC_SUBST(STLPORT_ROOT, /usr/local/STLport)

  CPPFLAGS="-I${STLPORT_ROOT}/include/stlport -D_STLP_DEBUG  $CPPFLAGS"
  LIBS="$LIBS -L${STLPORT_ROOT}/lib -lstlportstlg" 

fi # $with_stlport = yes


# Define the common libraries and their include directories.
# For 'make distcheck' to work, the include dir path must be relative
# to $top_srcdir and the library path relative to $top_builddir.

AC_SUBST(SSE_INC_DIR, "\$(top_srcdir)/include")

AC_SUBST(AAPLUS_INC_DIR, "\$(top_srcdir)/aaplusLib")
AC_SUBST(AAPLUS_LIB, "\$(top_builddir)/aaplusLib/libaaplus.a")

AC_SUBST(WCS_INC_DIR, "\$(top_srcdir)/wcsLib")
AC_SUBST(WCS_LIB, "\$(top_builddir)/wcsLib/libwcs.a")

AC_SUBST(NOVAS_INC_DIR, "\$(top_srcdir)/novasLib")
AC_SUBST(NOVAS_LIB, "\$(top_builddir)/novasLib/libnovas.a")

AC_SUBST(BOOST_INC_DIR, "\$(top_srcdir)/boostLib")

AC_SUBST(SSEUTIL_INC_DIR, "\$(top_srcdir)/sseutil")
AC_SUBST(SSEUTIL_LIB, "\$(top_builddir)/sseutil/libsseutil.a")

AC_SUBST(SSECOMMUTIL_INC_DIR, "\$(top_srcdir)/ssecommutil")
AC_SUBST(SSECOMMUTIL_LIB, "\$(top_builddir)/ssecommutil/libssecommutil.a")

AC_SUBST(SSE_INTERFACE_INC_DIR, "\$(top_srcdir)/sseInterfaceLib")
AC_SUBST(SSE_INTERFACE_LIB, "\$(top_builddir)/sseInterfaceLib/libsseInterface.a")

AC_SUBST(SSE_DX_INTERFACE_INC_DIR, "\$(top_srcdir)/sseDxInterfaceLib")
AC_SUBST(SSE_DX_INTERFACE_LIB, "\$(top_builddir)/sseDxInterfaceLib/libsseDxInterface.a")

AC_SUBST(GPIB_INTERFACE_INC_DIR, "\$(top_srcdir)/GPIBInterfaceLib")
AC_SUBST(GPIB_INTERFACE_LIB, "\$(top_builddir)/GPIBInterfaceLib/libGPIBInterface.a")

AC_SUBST(DOPPLER_INC_DIR, "\$(top_srcdir)/doppler")
AC_SUBST(DOPPLER_LIB, "\$(top_builddir)/doppler/libdoppler.a")

AC_SUBST(SSE_DX_ARCHIVER_INTERFACE_INC_DIR, "\$(top_srcdir)/sseDxArchiverInterfaceLib")
AC_SUBST(SSE_DX_ARCHIVER_INTERFACE_LIB, "\$(top_builddir)/sseDxArchiverInterfaceLib/libsseDxArchiverInterface.a")

AC_SUBST(SSE_CHANNELIZER_INTERFACE_INC_DIR, "\$(top_srcdir)/sseChannelizerInterfaceLib")
AC_SUBST(SSE_CHANNELIZER_INTERFACE_LIB, "\$(top_builddir)/sseChannelizerInterfaceLib/libsseChannelizerInterface.a")

AC_SUBST(SSE_TSCOPE_INTERFACE_INC_DIR, "\$(top_srcdir)/sseTscopeInterfaceLib")
AC_SUBST(SSE_TSCOPE_INTERFACE_LIB, "\$(top_builddir)/sseTscopeInterfaceLib/libsseTscopeInterface.a")

AC_SUBST(MYSQL_ROOT, "/usr/local/mysql")

AC_SUBST(ACE_ROOT)
AC_SUBST(CPPUNIT_ROOT)

AC_CONFIG_FILES([Makefile
	  m4/Makefile
	  include/Makefile
          aaplusLib/Makefile
	  wcsLib/Makefile
	  novasLib/Makefile
	  doppler/Makefile
	  sseutil/Makefile
	  ssecommutil/Makefile
	  GPIBInterfaceLib/Makefile
	  sse/Makefile
	  sseInterfaceLib/Makefile
	  sseDxInterfaceLib/Makefile
	  sseTscopeInterfaceLib/Makefile
	  sseDxArchiverInterfaceLib/Makefile
	  sseChannelizerInterfaceLib/Makefile
	  simulators/Makefile
	  simulators/dxsim/Makefile
	  simulators/chansim/Makefile
	  simulators/scienceData/Makefile
	  tsig/Makefile
	  tscope/Makefile
	  ifc/Makefile
	  dxArchiver/Makefile
	  setup/Makefile
	  util/Makefile
	  jseeker/Makefile
	  database/Makefile
	])
AC_OUTPUT

