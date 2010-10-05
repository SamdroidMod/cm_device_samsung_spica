#
# Copyright (C) 2008 The Android Open Source Project
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
#

DEVICE_PACKAGE_OVERLAYS := device/samsung/spica/overlay

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.GT-I5700

# Passion uses high-density artwork where available
PRODUCT_LOCALES += mdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.media.dec.jpeg.memcap=10000000

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=45
