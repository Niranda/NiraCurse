#!/bin/sh
#
###
#:version:		2.0
#:date:			Time-stamp: <15-May-15 21:14:50 UTC+2>
#:author:		Niranda <http://www.Niranda.net
#:copyright:	© 2015 Niranda.net
#:license:		See README.md
###

pluginScript=$1

if [ "$(echo $pluginScript | cut -c1-1)" != "#" ] && [ "$(echo $pluginScript | cut -c1-1)" != "" ]; then
	. ./settings.conf

	pathToScript="$pluginPath/$pluginScript"

	if [ -f $pathToScript ]; then
		./$pathToScript
	else
		echo " *   ERROR: PlugIn <${pluginScript}> doesn't exist!"
	fi

fi