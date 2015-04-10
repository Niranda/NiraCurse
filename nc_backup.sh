#!/bin/sh

. ./settings.conf


# echo
if [ $(($(ls -f $backupPath/ | wc -l)-2)) -ge $maxBackups ]; then
	echo " *   Reached $maxBackups of backups. Delete the oldest..."
fi

# Delete
maxBackups=$((maxBackups-1))
ls $backupPath -t | sed -e "1,"$maxBackups"d" | grep -P "($backupPrefix)(.*?)(.zip)" | xargs -I file -d '\n' rm $backupPath"/"file

# Backup
echo " *   Create new backup..."
zip -q -r $backupPath/$backupPrefix$(date +"%Y%m%d%H%M%S")".zip"  $addonPath/*
echo " *   Done. Created "$backupPrefix$(date +"%Y%m%d%H%M%S")".zip"
