#!/bin/sh
#
###
#:version:		2.0
#:date:			Time-stamp: <15-May-15 21:14:50 UTC+2>
#:author:		Niranda <http://www.Niranda.net
#:copyright:	© 2015 Niranda.net
#:license:		See README.md
###

addonLink=$1

if [ "$(echo $addonLink | cut -c1-1)" != "#" ] && [ "$(echo $addonLink | cut -c1-1)" != "" ]; then
	. ./settings.conf
	
	addonZipName=$(basename $addonLink)

	wget -q -O "$tmpPath/$addonZipName" $addonLink

	if [ -f "$tmpPath/$addonZipName" ]; then
		echo " *   Downloaded $addonZipName"
		echo "$addonZipName" >> $unziplist
	else
		echo " *   ERROR: $addonZipName wasn't downloaded!"
	fi

fi