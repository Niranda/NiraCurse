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

serverlist="$addonPath/_nc_plugin_zygorAhData_serverlist.conf"
pathZygorGold="$addonPath/ZygorGuidesViewer/Data/Gold"


echo " * Zygor Gold Guide Update..."

# ensure that all directories exists
mkdir -p $pathZygorGold

# prepair XML file
echo '<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/FrameXML/UI.xsd">' > $pathZygorGold/files.xml

# Download Global and save it in files.xml
echo " *   Downloaded global data"
wget -q -O "$pathZygorGold/xx_global.lua" https://www.getfirehawk.com/ahData?region=xx&realm=global&do=dump
echo '<Script file="xx_global.lua"/>' >> $pathZygorGold/files.xml

# Download server-data
echo
echo " *   Start downloading server-data"
xargs -a $serverlist -n 1 -P $parallel ./$pluginPath/nc_plugin_zygorAhData_download.sh

# finish XML file
echo "</Ui>" >> $pathZygorGold/files.xml