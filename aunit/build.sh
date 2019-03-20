#!/bin/bash
TARGET=$1
LIB=$2
shift 2

CURRENT_DIRECTORY=`pwd`
BUILD_DIRECTORY=$CURRENT_DIRECTORY/bin
PROJECT_DIRECTORY=$CURRENT_DIRECTORY../..

echo BUILD_DIRECTORY $BUILD_DIRECTORY
echo CURRENT_DIRECTORY $CURRENT_DIRECTORY
echo LIB $LIB
echo PROJECT_DIRECTORY $PROJECT_DIRECTORY
echo TARGET $TARGET

killall -9 main
$PROJECT_DIRECTORY/gpr/setup.sh      \
    gprbuild                \
    main.gpr                \
    macosx                  \
    $LIB                    \
    $TARGET                 \
    $BUILD_DIRECTORY        \
    $PROJECT_DIRECTORY      \
    -aP ../lib -aP ../main $@
