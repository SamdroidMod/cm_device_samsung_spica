# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/samsung/spica/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true
TARGET_NO_KERNEL := true

TARGET_BOARD_PLATFORM := s3c6410
TARGET_ARCH_VARIANT := armv5te-vfp

TARGET_CPU_ABI := armeabi

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

USE_CAMERA_STUB := false
BOARD_USES_ECLAIR_LIBCAMERA := true

BOARD_HAVE_BLUETOOTH := true
BT_USE_BTL_IF := true
BT_ALT_STACK := true

BRCM_BTL_INCLUDE_A2DP := true
BRCM_BT_USE_BTL_IF := true

BOARD_EGL_CFG := device/samsung/spica/prebuilt/egl/egl.cfg

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00280000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00500000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x07500000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_FFORMAT := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true

BOARD_BOOT_DEVICE := /dev/block/bml7
BOARD_DATA_DEVICE := /dev/block/mmcblk0p2
BOARD_DATA_FILESYSTEM := rfs
BOARD_DATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_HAS_DATADATA := true
BOARD_DATADATA_DEVICE := /dev/block/stl10
BOARD_DATADATA_FILESYSTEM := rfs
BOARD_DATADATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_SYSTEM_DEVICE := /dev/block/stl9
BOARD_SYSTEM_FILESYSTEM := rfs
BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
BOARD_CACHE_DEVICE := /dev/block/stl11
BOARD_CACHE_FILESYSTEM := rfs
BOARD_CACHE_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
# The following is the *actual* sd card, but those don't mount in recovery.
# The mmc blocks aren't even available.
# Only internal storage (mmcblk0) is available.
#BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1
#BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
#BOARD_USES_BMLUTILS := true

#TARGET_PREBUILT_KERNEL := device/samsung/spica/kernel

BOARD_WLAN_DEVICE           := eth0
WIFI_DRIVER_MODULE_PATH     := "/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/rtecdc.bin nvram_path=/system/etc/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

BOARD_HAVE_GPS_HARDWARE := true
BOARD_GPS_LIBRARIES := libsecgps libsecril-client
