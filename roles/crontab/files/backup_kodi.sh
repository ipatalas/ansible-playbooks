#!/bin/bash

BACKUP_ROOT="/media/Backups/osmc backup"
DAY=`date +"%Y-%m-%d"`
DEST="$BACKUP_ROOT/userdata-$DAY.tgz"
LINK="$BACKUP_ROOT/latest.tgz"

tar -czf "$DEST" -C /home/osmc/.kodi/userdata .

# Remove old link
if [ -h "$LINK" ]; then
  echo "Removing previous 'latest' link"
  ls -l "$LINK"
  rm "$LINK"
fi

# Symlink to latest backup
ln -s "$DEST" "$LINK"
