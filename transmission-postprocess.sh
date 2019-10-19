#!/bin/sh -xu

cd ${TR_TORRENT_DIR}/${TR_TORRENT_NAME}
mkdir unrar
cd unrar
unrar e -r -o- ../*.rar
unrar e -r -o- *.rar