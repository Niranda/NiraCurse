#!/bin/sh
#
###
#:version:		2.0
#:date:			Time-stamp: <15-May-15 21:14:50 UTC+2>
#:author:		Niranda <http://www.Niranda.net
#:copyright:	© 2015 Niranda.net
#:license:		See README.md
###

addonName=$1

if [ "$(echo $addonName | cut -c1-1)" != "#" ] && [ "$(echo $addonName | cut -c1-1)" != "" ]; then
	. ./settings.conf

	# curse-variables
	curseUrl="http://www.curse.com/addons/wow/$addonName/download"
	reg="http://addons.curse.cursecdn.com/files/(.*?).zip"


	addonLink=$( wget -qO- $curseUrl |grep -P $reg -o )

	if [ "$addonLink" = "" ]; then
		echo "404 - There is no Addon-File on curse!"				# File not found! (can't find addon)
	else
		addonZipName=$(basename $addonLink)
		update=$( cat $curV |grep $addonZipName )

		if [ "$update" != "" ]; then
			echo " *   still up2date: $addonName"
			echo "$addonZipName (still up2date)" >> $newV
		else
			echo " *   Update: $addonName"
			echo "$addonZipName (update)" >> $newV
			echo "$addonLink" >> $dwnlist
		fi
	fi

fi