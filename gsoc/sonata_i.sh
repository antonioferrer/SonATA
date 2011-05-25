#!/bin/bash
################################################################################
#
# File   : sonata_i.sh
# Project: SonATA
# Authors: The SonATA code is the result of many programmers
#          over many years
#
# Copyright 2011 The SETI Institute
#
# SonATA is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# SonATA is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with SonATA. If not, see<http://www.gnu.org/licenses/>.
#
# Implementers of this code are requested to include the caption
# "Licensed through SETI" with a link to setiQuest.org.
#
# For alternate licensing arrangements, please contact
# The SETI Institute at www.seti.org or setiquest.org.
#
################################################################################




cd /tmp
exec > >(tee  ${0##*/}-$(date +"%b-%d-%y").log) ## Log the Script
clear


####################################################################################
#                            Checking for SonATA				   #
####################################################################################
if [ -f $HOME'/SonATA/LICENSE.txt' ]
then
echo "SonATA successfully found"
else
echo "SonATA not found"
echo "If you want to contribute you should open a github account and use the" 
echo "            standard GitHub fork/pull mechanism"				
sleep 1
echo " For more information visit http://setiquest.org/wiki/index.php/GitHub"
echo "       and http://setiquest.org/content/sonata-download               "
sleep 1
echo "If you want to continue building by downloading the SonATA without Github fork/pull"
echo "              press y or otherwise this script will exit"
read choice
    if [ $choice = y -o $choice = Y ]
    then 
    cd ~
    git clone git://github.com/setiQuest/SonATA.git 
    else
    exit 0    
    fi
fi 
sleep 3

####################################################################################
#               Installing the dependencies for SonATA				   #
####################################################################################
echo "Installing the dependencies for SonATA"
sudo zypper install https://github.com/khrm/SonATA/blob/gsoc/gsoc/sonata-build-meta-1.0.alpha-1.noarch.rpm?raw=true
sleep 3

####################################################################################
#                Configuring the java                           		   #
####################################################################################
echo "Configure the Java to use Sun Java version"
sudo su -c 'update-alternatives --config javac'
sudo su -c 'update-alternatives --config java'
sleep 3

####################################################################################
#                Downloading the extra libraries and data       		   #
####################################################################################
echo "Downloading the extra libraries and data"

echo "Getting the ACE"
cd ~/SonATA/scripts
./get_packages
sleep 2
echo "Getting the Voyager data"
mkdir ~/sonata_install
mkdir ~/sonata_install/data
cd ~/sonata_install/data
wget http://setiquest.org/sonata_files/vger-xpol-2010-07-14-406.pktdata.tar.Z
tar -xvzf vger-xpol-2010-07-14-406.pktdata.tar.Z
sleep 3

####################################################################################
#                Preparing the files       		                           #
####################################################################################
echo "Preparing the files"
sed 's@ACE_ROOT="$ACE_ROOT"@ACE_ROOT="'$HOME'/SonATA/packages/ACE_wrappers"@g'    ~/SonATA/sse-pkg/configure.in | grep ACE_ROOT=
sed 's@lappend ::auto_path /usr/local/lib@lappend ::auto_path '$HOME'/sonata_install/lib@g' ~/SonATA/scripts/sserc.tcl | grep lappend
sleep 3

####################################################################################
#                Creating a ssh key and configuring it          		   #
####################################################################################
echo "Starting the ssh daemon"
sudo /etc/init.d/sshd start
cd ~/.ssh
echo "Creating the ssh key"
ssh-keygen

cp ./id_rsa.pub authorized_keys
echo "###########################################################"
echo "#     Type ssh $USERNAME@`hostname` and then exit         #"
echo "###########################################################"
sleep 3
echo "This will set the automatic key usage without password"
sleep 2

echo "Continue building SonATA now by following the instruction here:http://setiquest.org/content/sonata-build" 


