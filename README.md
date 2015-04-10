# NiraCurse
A Shell-based curse client to update your wow-addons.

## Requirements
* xargs
* wget
* zip
* unzip
* (tested on Ubuntu Server 14.04 LTS)

## How to install
1. You have to install all packages named above in "Requirements"
2. Move all files to your preferred install location
3. Create 3 dirs for temporary files (tmp), wow-addons (addons) and backups (backup)
4. Change the 3 paths to the tmp, addons and backup folder in settings.conf

## How to use
1. Edit the "addonlist.conf" and add for each line your preferred addon.
Visit http://www.curse.com/addons/wow/ and click on your addon. Now you can see the correct name of the addon in the adressbar.
F.e. DBM will be "deadly-boss-mods" because of "http://www.curse.com/addons/wow/deadly-boss-mods"
2. run `./NiraCurse.sh` and lean back :-)

![Where to find the name](./README_img_addonname.jpg)

## How to update
1. Copy your old "settings.conf" and "addonlist.conf" to a safe location
2. Overwrite the old files with the newest ones
3. Overwrite the new "addonlist.conf" with your old, copied "addonlist.conf" out of your safe location
4. For "settings.conf" edit the new one and change all what you need (may you have to watch into the old, copied file)

## Important
You have to support Curse! So [buy premium](http://www.curse.com/premium) before using NiraCurse!
I'm not responsible for any damage caused or whatever can happen like a tornado or a nuclear disaster!

## Licensing
This program is published under the terms of the GNU GPL v3 excluding a commercial/profit-oriented use. If you want to use this framework in a commercial context you have to buy an individual license. Therefore please contact the administrator of this repository.
