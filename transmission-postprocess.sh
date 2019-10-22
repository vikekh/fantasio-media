#!/bin/sh -xu

cd ${TR_TORRENT_DIR}/${TR_TORRENT_NAME}
UNRAR_DIR=./unrar
mkdir $UNRAR_DIR
cd $UNRAR_DIR
find .. -name *.rar -exec unrar e -o- {} \;
find . -name *.rar -exec unrar e -o- {} \; -delete
cd ..
rmdir -r $UNRAR_DIR