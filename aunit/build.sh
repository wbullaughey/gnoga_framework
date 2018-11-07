#source ./environment.sh
#PROJECT_DIRECTORY=$1
#export PROJECT_DIRECTORY
#echo PROJECT_DIRECTORY $PROJECT_DIRECTORY
#GNOGA_INSTALL=~/vendor/gnoga-1.4a/install
#export GPR_PROJECT_PATH=$GNOGA_INSTALL/share/gpr:$GNOGA_INSTALL/lib/gnat
#
#echo ARCHITECTURE $ARCHITECTURE
#echo BASE_PATH $BASE_PATH
#echo GPR_DIRECTORY $GPR_DIRECTORY
#echo LIB $LIB
#echo PATH $PATH
#echo PROJECT $PROJECT
#echo TARGET $TARGET
#echo USER $USER
#
#!/bin/bash
BUILD_DIRECTORY=`pwd`/bin
killall -9 main
~/project/bin/setup.sh gprbuild main.gpr $BUILD_DIRECTORY $@ \
    -aP ../lib -aP ../main -d
