#!/bin/sh

. ./settings.conf


# Code...

echo "================================================"
echo
echo " *** NiraCurse - The shellbased Curse Client ***"
echo
echo "================================================"
echo
echo " * Checking $addonlist for AddOns..."

# initialize files...
echo "Last update: "$(date +%Y-%m-%d/%H:%M:%S) > $newV
> $dwnlist								# clear up the downloadlist
> $unziplist								# unziplist, too
> $newV
if [ ! -f "$curV" ]; then > $curV; fi


# Go...
# ToDo: here load plugins
xargs -a $addonlist -n 1 -P $parallel ./nc_check.sh			# parallelization of update-check

echo

if [ ! -s $dwnlist ]; then						# there no updates
	echo " * All AddOns are up2date - NiraCurse is done!"
else									# some updates found
	echo " * Create a backup of current installed addons..."
	./nc_backup.sh							# create a backup

	echo
	echo " * There are $(wc -l < $dwnlist) AddOn-Updates available..."
	xargs -a $dwnlist -n 1 -P $parallel ./nc_download.sh		# download this updates

	echo
	echo " * Unzip $(wc -l < $unziplist) downloaded Addons..."
	xargs -a $unziplist -n 1 -P $parallel ./nc_unzip.sh		# unzip downloaded updates

	echo
	echo " * Now all AddOns are up2date - NiraCurse is done!"
fi

mv $newV $curV								# make the new the current Versions

rm $dwnlist								# cleanup...
rm $unziplist



echo
echo
echo "================================================"
echo " ***    NiraCurse - (c) Niranda.net 2015    *** "
echo
echo "Simple to use - Easy to get - Visit: Niranda.net"
echo "================================================"
echo
echo
