#!/bin/sh
#
###
#:version:		2.0
#:date:			Time-stamp: <15-May-15 21:14:50 UTC+2>
#:author:		Niranda <http://www.Niranda.net
#:copyright:	© 2015 Niranda.net
#:license:		See README.md
###

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
