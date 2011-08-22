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
AC_INIT([SonATA],[version-1.0])
AC_ARG_PROGRAM
AM_MAINTAINER_MODE
AM_INIT_AUTOMAKE
AM_INIT_AUTOMAKE([foreign])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES])

AC_CONFIG_HEADERS(config.h)

AC_PREFIX_DEFAULT($HOME/sonata_install)

AC_CONFIG_SUBDIRS([tclreadline	
                   CppUnit
                   sse-pkg
                   sig-pkg
                   scripts])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
