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

