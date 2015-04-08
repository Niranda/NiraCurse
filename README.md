# NiraCurse
A Shell-based curse client to update your wow-addons

## Requirement
* a running shell ;)
* xargs, wget (should already be included in your OS)
* tested on Ubuntu Server 14.04 LTS


## How to use
1) Create a tmp and a addon -dir where files can be downloaded (tmp) and unpacked (addons, this should be your wow-addon folder)
2) change the paths in the nc_... files for the tmpPath and addonPath variables. A centralized config-file is coming soon!
3) Edit the "addonlist.conf" and add for each line your preferred addon.
Visit http://www.curse.com/addons/wow/ and click on your addon. Now you can see the correct name of the addon in the adressbar.
F.e. DBM will be "deadly-boss-mods" because of "http://www.curse.com/addons/wow/deadly-boss-mods"
4) run ./NiraCurse.sh and lean back :-)

## IMPORTANT
Do a Backup BEFORE you run my awesome NiraCurse. (Autobackup will come soon)
I'm not responsible for any damage caused or whatever can happen like a tornado or a nuclear disaster!

## Licensing
This program is published under the terms of the GNU GPL v3 excluding a commercial/profit-oriented use. If you want to use this framework in a commercial context you have to buy an individual license. Therefore please contact the administrator of this repository.
