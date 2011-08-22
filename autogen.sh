#!/bin/sh
################################################################################
#
# File:    autogen.sh
# Project: SonATA
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

#The next three line enables autogen to run from any directory.#

pathautogen="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
curpath=`dirname "$pathautogen"`
cd $curpath


echo "Checking whether the system fulfils the minimum requirements"
sleep 1    
quo=`awk 'match($1,"MemTotal") == 1 {print $2}' /proc/meminfo`
div=1048576
ram=`echo "scale=2;$quo/$div" | bc`

if [ `echo "$ram < 3.8" | bc` -eq 1 ]
then
   echo "Insufficient ram to run the SonATA"
   sleep 1
   echo "But SonATA may be build though it will not run probably."
   echo "Would you like to continue building it?"
   while true; do
   read choice
   case $choice in
         [Yy]* ) echo "Continuing with the build";break;;
         [Nn]* ) echo "Aborting the build";exit 1;;
         * ) echo "Please answer yes or no.";;
   esac
   done
fi

cores_no=`cat /proc/cpuinfo | grep ^processor | wc -l`
if [ $cores_no -lt 2 ]
then
   echo "SonATA requires 2 cores to run. You seem to have only one."
   sleep 1
   echo "But SonATA may be build though it will not run probably."
   echo "Would you like to continue building it?"
   while true; do
   read choice
   case $choice in
         [Yy]* ) echo "Continuing with the build";break;;
         [Nn]* ) echo "Aborting the build";exit 1;;
         * ) echo "Please answer yes or no.";;
   esac
   done
fi

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


echo "Running Autotools in tclreadline" 
cd tclreadline
./autogen.sh
cd ..


echo "Running Autotools in CppUnit" 
cd CppUnit
./autogen.sh
cd ..


echo "Running Autotools in sse-pkg" 
cd sse-pkg
./autogen.sh
cd ..


echo "Running Autotools in sig-pkg" 
cd sig-pkg
./autogen.sh
cd ..


echo "Running Autotools in scripts" 
cd scripts
./autogen.sh


