BUILD_DIRECTORY=`pwd`/bin
killall -9 main
~/project/bin/setup.sh gprbuild main.gpr $BUILD_DIRECTORY $@ \
    -aP ../lib  -d -f
