#!/bin/bash
####################################################################################
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
####################################################################################




cd /tmp
exec > >(tee  ${0##*/}-$(date +"%b-%d-%y").log) ## Log the Script
clear

####################################################################################
#               Installing the dependencies for SonATA                             #
####################################################################################
echo "Installing the dependencies for SonATA"
sudo zypper -n update
sudo zypper ar http://download.opensuse.org/distribution/11.3/repo/non-oss non-oss
sudo zypper ar http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_11.3/ Multimedia_Libs
wget https://github.com/khrm/SonATA/blob/gsoc/gsoc/sonata-build-meta-1.0.alpha-1.noarch.rpm?raw=true
sudo zypper install sonata-build-meta-1.0.alpha-1.noarch.rpm
rm sonata-build-meta-1.0.alpha-1.noarch.rpm
sleep 3

####################################################################################
#                Configuring the java                                              #
####################################################################################
echo "Configure the Java to use Sun Java version"
sudo su -c 'update-alternatives --config javac'
sudo su -c 'update-alternatives --config java'
sleep 3

####################################################################################
#                            Checking for SonATA                                   #
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
echo "Do you want to continue building by downloading the SonATA without Github fork/pull (y/n)"
   while true; do
   read choice
   case $choice in
      [Nn]* ) echo  "Aborting the build"
	      exit 1;;
      [Yy]* ) echo  "Downloading the SonATA"
              cd $HOME
              git clone git://github.com/khrm/SonATA.git
              cd SonATA
              git checkout -t -b gsoc remotes/origin/gsoc
              break;;
          * ) echo "Only y or n accepted";;   
          esac
          done
fi 
sleep 3

####################################################################################
#                Downloading the extra libraries and data                          #
####################################################################################
echo "Downloading the extra libraries and data"

echo "Getting the ACE"
cd ~/SonATA/
PACKAGES_VERSION=packages_1.0
PACKAGES_DIR=packages
PACKAGES_FILE=$PACKAGES_VERSION.tar.gz
wget http://setiquest.org/sonata_files/$PACKAGES_FILE
tar zxf $PACKAGES_FILE
rm -fr $PACKAGES_FILE
mv $PACKAGES_VERSION $PACKAGES_DIR
PACKAGES_PATH=`pwd`/$PACKAGES_DIR
ACE_ROOT=$PACKAGES_PATH/ACE_wrappers
sleep 2
if [ -f $HOME'/sonata_install/data/vger-xpol-2010-07-14-406.pktdata' ]
then 
echo "Voyager Data Found"
else
echo "Getting the Voyager data"
mkdir ~/sonata_install
mkdir ~/sonata_install/data
cd ~/sonata_install/data
wget http://setiquest.org/sonata_files/vger-xpol-2010-07-14-406.pktdata.tar.Z
tar -xvzf vger-xpol-2010-07-14-406.pktdata.tar.Z
fi
sleep 3


####################################################################################
#                Preparing the files                                               #
####################################################################################
echo "Preparing the files"
sed -i 's@lappend ::auto_path /usr/local/lib@lappend ::auto_path '$HOME'/sonata_install/lib@g' ~/SonATA/scripts/sserc.tcl
echo "Resource the environment using assumption that you are using bash?(y/n)"
   while true; do
   read choice
   case $choice in
      [Nn]* ) echo  "Your shell should have these variable if you are using bash or equvialent other shell"
              echo  '  export ACE_ROOT=$HOME/SonATA/packages/ACE_wrappers
                       export PACKAGES_PATH=$HOME/SonATA/packages
                       export LD_LIBRARY_PATH=$ACE_ROOT/ace:$ACE_ROOT/lib:$PACKAGES_PATH/lib:$LD_LIBRARY_PATH
                       export PATH=.:$HOME/sonata_install/bin:$PACKAGES_PATH/bin:$PATH
                       ulimit -s unlimited'
                       break;;
      [Yy]* ) echo  "Resourcing the enviroment by changing .bashrc"
              sed -i '
$ a\
export ACE_ROOT=$HOME/SonATA/packages/ACE_wrappers\
export PACKAGES_PATH=$HOME/SonATA/packages\
export LD_LIBRARY_PATH=$ACE_ROOT/ace:$ACE_ROOT/lib:$PACKAGES_PATH/lib:$LD_LIBRARY_PATH\
export PATH=.:$HOME/sonata_install/bin:$PACKAGES_PATH/bin:$PATH\
ulimit -s unlimited' ~/.bashrc
                       break;;
          * ) echo "Only y or n are accepted";;   
          esac
          done 
export ACE_ROOT=$HOME/SonATA/packages/ACE_wrappers

####################################################################################
#                Creating the script for testing SonATA                            #
####################################################################################
mkdir -p ~/sonata_install
mkdir -p ~/sonata_install/bin
touch ~/sonata_install/bin/test_sonata
rm ~/sonata_install/bin/test_sonata
cat >  ~/sonata_install/bin/test_sonata <<EOD
#!/bin/tcsh
cd ~/sonata_install/scripts
source spacecraft-demo-xpol-env-vars.tcsh
ssh-add ~/.ssh/id_rsa 
runsse.sh
EOD
chmod +x  ~/sonata_install/bin/test_sonata

####################################################################################
#                Creating a ssh key and configuring it                             #
####################################################################################
echo "Starting the ssh daemon"
sudo /etc/init.d/sshd start
cd ~/.ssh 2>/dev/null || (mkdir ~/.ssh && chmod 700 ~/.ssh) && cd ~/.ssh
echo "Creating the ssh key"
ssh-keygen -f id_rsa -t rsa -q
ssh-copy-id -i ~/.ssh/id_rsa.pub `whoami`@`hostname`
echo "###########################################################"
echo "#     Type ssh `whoami`@`hostname` and then exit          #"
echo "###########################################################"
sleep 3
echo "This will set the automatic key usage without password"


