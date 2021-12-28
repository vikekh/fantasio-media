#!/bin/bash

# https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes

if [ -z "$1" ]; then
    echo "No argument"
    exit 1
fi

# DATE=$(date '+%Y-%m-%d')
# BACKUP_DIR="${1}/${DATE}"
BACKUP_DIR=$1
mkdir $BACKUP_DIR
# rm -r "${BACKUP_DIR}"/*

docker stop bazarr
docker stop jackett
docker stop overseerr
docker stop plex
docker stop radarr
docker stop sonarr
docker stop tautulli

docker run --rm -v bazarr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/bazarr-config.tar /data
docker run --rm -v jackett-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/jackett-config.tar /data
docker run --rm -v overseerr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/overseerr-config.tar /data
docker run --rm -v plex-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/plex-config.tar /data
docker run --rm -v radarr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/radarr-config.tar /data
docker run --rm -v sonarr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/sonarr-config.tar /data
docker run --rm -v tautulli-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/tautulli-config.tar /data

docker start bazarr
docker start jackett
docker start overseerr
docker start plex
docker start radarr
docker start sonarr
docker start tautulli