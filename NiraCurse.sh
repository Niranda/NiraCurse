#!/bin/sh


# ToDo: move to config-file!
parallel=4								# number of parallelization for check and download
addonlist="addonlist.conf"
addonPath="addons"
tmpPath="tmp"

newV="$tmpPath/_nc_newVersions.log"
curV="$addonPath/_nc_currentVersions.log"
dwnlist="$tmpPath/_nc_downloadlist"
unziplist="$tmpPath/_nc_unziplist"


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

xargs -a $addonlist -n 1 -P $parallel ./nc_check.sh			# parallelization of update-check

# No xargs? Than use this methode ;-)
#while read line; do
#	./nc_check.sh "$line" &
#done < "$addonlist"
#wait



echo

if [ ! -s $dwnlist ]; then
	echo " * All AddOns are up2date - NiraCurse is done!"
else
	echo " * There are $(wc -l < $dwnlist) AddOn-Updates available..."

	xargs -a $dwnlist -n 1 -P $parallel ./nc_download.sh

# No xargs? Than use this methode ;-)
#	while read line; do
#		./nc_download.sh "$line" &
#	done < "$dwnlist"
#	wait


	echo
	echo " * Unzip $(wc -l < $unziplist) downloaded Addons..."
	xargs -a $unziplist -n 1 -P $parallel ./nc_unzip.sh

# No xargs? Than use this methode ;-)
#	while read line; do
#		./nc_unzip.sh "$line" &
#	done < "$unziplist"
#	wait

	echo
	echo " * Now all AddOns are up2date - NiraCurse is done!"
fi

mv $newV $curV								# make the new the current Versions

rm $dwnlist								# cleanup...
rm $unziplist



echo
echo
echo " ***        NiraCurse - (c) Niranda.net 2015          *** "
echo
echo "     Simple to use - Easy to get - Visit: Niranda.net     "
echo
echo
