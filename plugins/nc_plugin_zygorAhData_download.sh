#!/bin/sh
#
###
#:version:		2.0
#:date:			Time-stamp: <15-May-15 21:14:50 UTC+2>
#:author:		Niranda <http://www.Niranda.net
#:copyright:	© 2015 Niranda.net
#:license:		See README.md
###

serverParam=$1
#startchar=${serverParam:0:1}

if [ "$(echo $serverParam | cut -c1-1)" != "#" ] && [ "$(echo $serverParam | cut -c1-1)" != "" ]; then
	. ./settings.conf

	region=$(echo $serverParam | cut -f1 -d_)
	server=$(echo $serverParam | cut -f2 -d_)
	urlZygorGold="https://www.getfirehawk.com/ahData?do=dump&region=$region&realm=$server"

	linkString='<Script file="'$region'_'$server'.lua"/>'

	pathZygor="$addonPath/ZygorGuidesViewer"
	pathZygorGold="$pathZygor/Data/Gold"


	if [ ! "$serverParam" = "" ]; then
		wget -q -O "$pathZygorGold/${region}_${server}.lua" $urlZygorGold

		if [ -f "$pathZygorGold/${region}_${server}.lua" ]; then
			echo " *     Downloaded data for ${region}-${server}"
			echo $linkString >> $pathZygorGold/files.xml
		else
			echo " *     ERROR: Data for ${region}-${server} wasn't downloaded!"
		fi
	fi
fi