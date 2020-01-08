#!/usr/bin/env playonlinux-bash
# Date : 2020-01-08 08:02
# Last revision : 2020-01-08 08:02
# Wine version used : TODO
# Distribution used to test : Mint (Ubuntu 18.04)
# Author : Chris Barrett
# PlayOnLinux : TODO
# Script licence : GPL3
# Program licence : Retail
# NOTES:
# - Be sure to `apt-get install wine32-development`.
# - And maybe `libwine-development:i386 libpulse0:i386`?
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE="Nitronic Rush"
PREFIX="NitronicRush"

POL_SetupWindow_Init
POL_Debug_Init

# We mostly used Win7 while developing the game.  Though WinXP _should_ also work.
Set_OS "win7"
Set_Desktop "On" "1366" "768"

POL_SetupWindow_presentation "$TITLE" "Team Nitronic - DigiPen Institute of Technology" "http://nitronic-rush.com" "Chris Barrett" "$PREFIX"
POL_System_TmpCreate "$PREFIX"

#####
# Get the installer
POL_SetupWindow_InstallMethod "LOCAL,DOWNLOAD"
if [ "$INSTALL_METHOD" = "LOCAL" ]; then
    POL_SetupWindow_browse "$(eval_gettext 'Please select the setup file to run.')" "$TITLE"
    INSTALLER_PATH=$APP_ANSWER
elif [ "$INSTALL_METHOD" = "DOWNLOAD"]; then
    cd "$POL_System_TmpDir"
    POL_Download "http://dl.nitronic-rush.com/NitronicRush_setup_20121221.2.exe" "58ce29d896ba0a07df6699abbe052cc3"
fi
#####


#####
# Install
POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate
Set_WineWindowTitle "$TITLE"

POL_SetupWindow_wait "$(eval_gettext 'Please wait while $TITLE is installed.')" "$TITLE"
POL_Wine "$INSTALLER_PATH"

POL_System_TmpDelete
POL_Shortcut "nrgame.exe" "$TITLE" "" "" "Game;"
#####

POL_SetupWindow_Close
exit

