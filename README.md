# android_device_xiaomi_davinci
For building OrangeFox Recovery for Xiaomi Redmi K20 / Mi 9T

OrangeFox Recovery Device Tree for Xiaomi Redmi K20 / Mi 9T

## Features

Works:

- ADB
- Decryption of /data
- Screen brightness settings
- Correct screenshot color
- MTP
- Flashing (opengapps, roms, images and so on)
- Backup/Restore (Needs more testing)
- USB OTG
- Android Q Support

TO-DO:

- Vibration support

## Compile

First sync the minimal OrangeFox sources:

```
repo init --depth=1 -u https://gitlab.com/OrangeFox/Manifest.git -b fox_9.0
repo sync -j8 --force-sync
```

Then add these projects to .repo/manifest.xml:

```xml
<project path="device/xiaomi/davinci" name="OrangeFoxRecovery/device_xiaomi_davinci" remote="github" revision="fox_9.0" />
```

Finally execute these:

```bash

.build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"

```

To test it:

```
fastboot boot out/target/product/davinci/recovery.img
```

## Other Sources

Precompiled stock kernel
## Thanks
