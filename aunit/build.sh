#!/bin/sh
# $1 = target program to build
# $2 = architecture: intel | ppm | lightender
# $3 = target: debug | release
echo running $0 at `pwd`

export PROGRAM=$1
export ARCHITECTURE=$2
export TARGET=$3
shift 3

while [ "$1" != "" ]; do    # use this to add extra defines like EDFA1
    echo define $1
        export $1
        shift 1
done

killall -9 main

./local_build.sh
