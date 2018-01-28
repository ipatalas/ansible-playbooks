#!/bin/bash

BACKUP_ROOT="/media/Backups/Grafana"
DAY=`date +"%Y-%m-%d"`
DEST="$BACKUP_ROOT/grafana-$DAY.tgz"
LINK="$BACKUP_ROOT/latest.tgz"

sudo tar -czf "$DEST" -C /var/lib/grafana/ grafana.db

# Remove old link
if [ -h "$LINK" ]; then
  echo "Removing previous 'latest' link"
  ls -l "$LINK"
  rm $LINK
fi

# Symlink to latest backup
ln -s "$DEST" "$LINK"

