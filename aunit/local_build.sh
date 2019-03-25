#!/bin/sh
echo running $0 at $pwd

echo build $PROGRAM for $ARCHITECTURE $TARGET
echo building libraries with $LIB
export BUILD_DATE=`date`
# echo BUILD_DATE=$BUILD_DATE
export PROJECT_DIRECTORY=`pwd`
echo PROJECT_DIRECTORY=$PROJECT_DIRECTORY
export ROOT_DIRECTORY="$PROJECT_DIRECTORY/../.."
echo "ROOT_DIRECTORY=$ROOT_DIRECTORY"
export GPR_PROJECT_PATH="$ROOT_DIRECTORY/gpr"
echo GPR_PROJECT_PATH=$GPR_PROJECT_PATH
echo "TARGET=$TARGET"
export SVN_DIRECTORY=$ROOT_DIRECTORY
echo "SVN_DIRECTORY=$SVN_DIRECTORY"
export GPR_OPTIONS="-v -j3"
echo GPR_OPTIONS=$GPR_OPTIONS

echo EXTRA="$EXTRA"
export USER=$USER
echo USER=$USER

$GPR_PROJECT_PATH/build_base.sh gprbuild $PROGRAM $ARCHITECTURE $TARGET $PROJECT_DIRECTORY $EXTRA \
-aP.                                \
-aP..       \
-aP../lib       \
-aP../main       \
-aP../../gpr             \


