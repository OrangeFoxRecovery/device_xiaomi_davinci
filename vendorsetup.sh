#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2021 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="davinci"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

	# Basic Vars
	export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export LC_ALL="C"
    	
	export PLATFORM_VERSION="16.1.0"
   	export PLATFORM_SECURITY_PATCH="2099-12-31"
   	export TW_DEFAULT_LANGUAGE="en"
	export TARGET_DEVICE_ALT="davinciin"
	export OF_TARGET_DEVICES="davinciin,davinci"
	export OF_PATCH_AVB20=1
   	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
   	export OF_USE_MAGISKBOOT="1"
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_FORCE_MAGISKBOOT_BOOT_PATCH_MIUI=1
	export FOX_DELETE_AROMAFM=1
	
	# Screen Settings
	export OF_SCREEN_H=2340
	export OF_STATUS_INDENT_LEFT="48"
	export OF_STATUS_INDENT_RIGHT="48"
	export OF_ALLOW_DISABLE_NAVBAR=0

	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_ZIP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_BUSYBOX_PS=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
    	export OF_USE_SYSTEM_FINGERPRINT=1
   	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1510672800"; # Tue Nov 14 15:20:00 GMT 2017
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v21.4.zip

	# OTA for custom ROMs
    	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
    	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
    
    	# -- add settings for R11 --
    	export FOX_R11=1
    	export OF_USE_TWRP_SAR_DETECT=1
    	export OF_MAINTAINER="Sushrut1101"
    	export OF_MAINTAINER_AVATAR="misc/Sushrut1101.png"
    	export FOX_VERSION="R11.1_0"
    	export FOX_BUILD_TYPE="Beta-Unofficial"

    	export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
    	export FOX_ADVANCED_SECURITY=1
    	# -- end R11 settings --

	# Run a Process after Formatting Data to Work-Around MTP Issues
	export OF_RUN_POST_FORMAT_PROCESS=1

    	if [ -n "$OF_MAINTAINER_AVATAR" ]; then
        	if [ ! -f "$OF_MAINTAINER_AVATAR" ]; then
              		# some colour codes
              		RED='\033[0;31m'
              		GREEN='\033[0;32m'
              		ORANGE='\033[0;33m'
              		BLUE='\033[0;34m'
              		PURPLE='\033[0;35m'
              		echo -e "${RED}-- File \"$OF_MAINTAINER_AVATAR\" not found  ...${NC}"
              		echo -e "${ORANGE}-- Downloading...${NC}"
              		mkdir -p misc
              		curl https://raw.githubusercontent.com/OrangeFoxRecovery/avatar/fox/Sushrut1101.png >> $OF_MAINTAINER_AVATAR
              		echo -e "${BLUE}-- Successfully Downloaded the Avatar Image \"$OF_MAINTAINER_AVATAR\" ...${NC}"
              		echo -e "${PURPLE}-- Using A Custom Maintainer Avatar from the Downloaded Image \"$OF_MAINTAINER_AVATAR\" ...${NC}"
              		echo -e "${GREEN}-- Done!"
        	fi
    	fi

	# Let's See What are our Build VARs!
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
