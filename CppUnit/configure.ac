dnl Process this file with autoconf to produce a configure script.
AC_INIT(test/framework/Test.h)
AM_CONFIG_HEADER(config.h)
AC_PREREQ(2.10)dnl               dnl Minimum Autoconf version required.
AM_MAINTAINER_MODE

AM_INIT_AUTOMAKE(CppUnit, 1.3)
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES])
dnl Checks for programs.
AC_PROG_CXX
AC_PROG_AWK
AC_PROG_CC
AC_PROG_CC_STDC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_RANLIB

dnl Checks for libraries.

dnl Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS(string.h)

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST

dnl Checks for library functions.

dnl To disable the shared library as they makes the example programs abort.
dnl user can override them using --enable-shared 
AC_DISABLE_SHARED
dnl initialize libtool
AC_PROG_LIBTOOL

AC_OUTPUT(Makefile
test/Makefile
test/framework/Makefile
test/framework/extensions/Makefile
test/textui/Makefile
samples/Makefile
samples/Multicaster/Makefile
doc/Makefile)
