#!/bin/sh
################################################################################
#
# File:    autogen.sh
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


# reconfigure the package
echo "libtoolize"
libtoolize --force --automake

echo "aclocal"
aclocal

echo "autoheader"
autoheader

echo "autoconf"
autoconf

echo "automake"
automake --add-missing --force-missing

echo "Running Autotools in sig-pkg/utilities/packetgen"
cd packetgen
./autogen.sh
cd ..


echo "Running Autotools in sig-pkg/utilities/packetrelay"
cd packetrelay
./autogen.sh
cd ..


echo "Running Autotools in sig-pkg/utilities/packetsend"
cd packetsend 
./autogen.sh
cd ..


echo "Running Autotools in sig-pkg/utilities/packetread"
cd packetread
./autogen.sh
cd ..


echo "Running Autotools in sig-pkg/utilities/packetchan2beam"
cd packetchan2beam
./autogen.sh
cd ..


echo "Running Autotools in sig-pkg/utilities/packetsqimport"
cd packetsqimport 
./autogen.sh
cd ..


