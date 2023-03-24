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
docker stop caddy
docker stop jackett
docker stop overseerr
docker stop plex
docker stop portainer
docker stop radarr
docker stop sonarr
docker stop tautulli
docker stop transmission

docker run --rm -v bazarr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/bazarr-config.tar /data
docker run --rm -v caddy-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/caddy-config.tar /data
docker run --rm -v caddy-data:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/caddy-data.tar /data
docker run --rm -v jackett-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/jackett-config.tar /data
docker run --rm -v overseerr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/overseerr-config.tar /data
docker run --rm -v plex-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/plex-config.tar /data
docker run --rm -v portainer-data:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/portainer-data.tar /data
docker run --rm -v radarr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/radarr-config.tar /data
docker run --rm -v sonarr-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/sonarr-config.tar /data
docker run --rm -v tautulli-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/tautulli-config.tar /data
docker run --rm -v transmission-config:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/transmission-config.tar /data
docker run --rm -v transmission-data:/data -v $BACKUP_DIR:/backup ubuntu tar cvf /backup/transmission-data.tar /data

docker start bazarr
docker start caddy
docker start jackett
docker start overseerr
docker start plex
docker start portainer
docker start radarr
docker start sonarr
docker start tautulli
docker start transmission