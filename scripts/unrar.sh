#!/bin/sh -xu

cd $TR_TORRENT_DIR

if [ ! -d $TR_TORRENT_NAME ] ; then
    exit 0
fi

cd $TR_TORRENT_NAME
UNRAR_DIR=./unrar
mkdir $UNRAR_DIR
cd $UNRAR_DIR
find .. -name *.rar -exec unrar e -o- {} \;
find . -name *.rar -exec unrar e -o- {} \;
find . -name *.rar -exec rm {} \;
cd ..
rmdir -r $UNRAR_DIR