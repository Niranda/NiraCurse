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


# Code...

echo "================================================"
echo
echo " *** NiraCurse - The shellbased Curse Client ***"
echo "                                          (v$version)"
echo "================================================"

# initialize directories
mkdir -p $tmpPath
mkdir -p $addonPath
mkdir -p $pluginPath
mkdir -p $backupPath

# initialize files...
echo "Last update: "$(date +%Y-%m-%d/%H:%M:%S) > $newV
> $dwnlist														# clear up the downloadlist
> $unziplist													# unziplist, too
> $newV
if [ ! -f "$curV" ]; then > $curV; fi

# Check for list-files
if [ ! -f $addonlist ]; then
	echo
	echo "!!! MISSING FILE: $addonlist !!!"
	echo "Please read the README.md and create this file."
	echo
	exit
fi
if [ ! -f $pluginlist ]; then
	echo
	echo "!!! MISSING FILE: $pluginlist !!!"
	echo "Please read the README.md and create this file."
	echo
	exit
fi


# Go...
echo
echo " * Checking $addonlist for AddOns and possible updates..."
xargs -a $addonlist -n 1 -P $parallel ./nc_check.sh				# parallelization of update-check

echo

if [ ! -s $dwnlist ]; then										# there no updates
	echo " * All AddOns are up2date - NiraCurse is done!"
else															# some updates found
	echo " * Create a backup of current installed addons..."
	./nc_backup.sh												# create a backup

	echo
	echo " * There are $(wc -l < $dwnlist) AddOn-Updates available..."
	xargs -a $dwnlist -n 1 -P $parallel ./nc_download.sh		# download this updates

	echo
	echo " * Unzip $(wc -l < $unziplist) downloaded Addons..."
	xargs -a $unziplist -n 1 -P $parallel ./nc_unzip.sh			# unzip downloaded updates

	echo
	echo " * Now all AddOns are up2date"
fi

mv $newV $curV													# make the new the current Versions

rm $dwnlist														# cleanup...
rm $unziplist


# Loading Plugins
echo
echo
echo " * Loading PlugIns..."
xargs -a $pluginlist -n 1 -P 1 ./nc_load_plugin.sh				# no parallelization for plugins!!!


echo
echo
echo " NiraCurse is done - Have fun! :)"
echo
echo
echo "================================================"
echo " ***    NiraCurse - (c) 2015 Niranda.net    *** "
echo "                                          (v$version)"
echo "Simple to use - Easy to get - Visit: Niranda.net"
echo "================================================"
echo
echo
