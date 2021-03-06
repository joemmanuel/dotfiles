#!/bin/bash

set -e

SCRIPT=`realpath $0`
ROOT=`dirname $SCRIPT`
ROOT=`dirname $ROOT`

if [ ! -d $ROOT/third_party/tmux/.git ]; then
	(cd $ROOT && git submodule update --init third_party/tmux)
fi

sudo apt-get build-dep tmux

cd $ROOT/third_party/tmux
if [ -f Makefile ]; then
	make clean
fi
sh autogen.sh
./configure --prefix=/usr
make -j6
sudo make install
