#!/bin/bash

BACKUP_ROOT="/media/Backups/Influx"
DAY=`date +"%Y-%m-%d"`
DEST_DIR="$BACKUP_ROOT/$DAY"
LINK="$BACKUP_ROOT/latest"

if [ -d "$DEST_DIR" ]; then
  echo "Removing previous backup from $DAY..."
  rm -rf "$DEST_DIR"
fi

mkdir "$DEST_DIR"
influxd backup -database telegraf "$DEST_DIR"

# Remove old link
if [ -h "$LINK" ]; then
  echo "Removing previous 'latest' link"
  ls -l "$LINK"
  rm $LINK
fi

# Symlink to latest backup
ln -s "$DEST_DIR" "$LINK"
