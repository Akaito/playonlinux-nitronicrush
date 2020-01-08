#!/usr/bin/env playonlinux-bash
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

POL_SetupWindow_Init

POL_SetupWindow_Close
exit

