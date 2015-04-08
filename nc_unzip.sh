#!/bin/sh

addonZipName=$1

# move to config-file
tmpPath="tmp"
addonPath="addons"


if [ "$addonZipName" = "" ]; then
	echo "204 - Missing parameter (nc_unzip <addonZipName>"			# No content! (missing parameter)
else
	if [ -f "$tmpPath/$addonZipName" ]; then
		unzip -q -d $addonPath -o $tmpPath/$addonZipName
		echo " *   Unzipped $addonZipName"
		rm $tmpPath/$addonZipName
	else
		echo " *   ERROR: $addonZipName is missed!"
	fi
fi


