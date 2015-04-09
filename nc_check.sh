#!/bin/sh

addonName=$1

. ./settings.conf

# curse-variables
curseUrl="http://www.curse.com/addons/wow/$addonName/download"
reg="http://addons.curse.cursecdn.com/files/(.*?).zip"


if [ "$addonName" = "" ]; then
	echo "204 - Missing parameter (nc_update <addonName>"			# No content! (missing parameter)
else
	addonLink=$( wget -qO- $curseUrl |grep -P $reg -o )

	if [ "$addonLink" = "" ]; then
		echo "404 - There is no Addon-File on curse!"			# File not found! (can't find addon)
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
