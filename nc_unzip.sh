#!/bin/sh
#
###
#:version:		2.0
#:date:			Time-stamp: <15-May-15 21:14:50 UTC+2>
#:author:		Niranda <http://www.Niranda.net
#:copyright:	© 2015 Niranda.net
#:license:		See README.md
###

addonZipName=$1

if [ "$(echo $addonZipName | cut -c1-1)" != "#" ] && [ "$(echo $addonZipName | cut -c1-1)" != "" ]; then
	. ./settings.conf
	
	if [ -f "$tmpPath/$addonZipName" ]; then
		unzip -q -d $addonPath -o $tmpPath/$addonZipName
		echo " *   Unzipped $addonZipName"
		rm $tmpPath/$addonZipName
	else
		echo " *   ERROR: $addonZipName is missed!"
	fi

fi