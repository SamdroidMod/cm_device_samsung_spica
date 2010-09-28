#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)


PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d /dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.product.multi_touch_enable=true \
    ro.product.max_num_touch=2


# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#
# Copy Spica specific prebuilt files
#

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/wifi/libwlmlogger.so:system/lib/libwlmlogger.so \
    device/samsung/spica/prebuilt/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/spica/prebuilt/wifi/nvram.txt:system/etc/nvram.txt \
    device/samsung/spica/prebuilt/wifi/rtecdc.bin:system/etc/rtecdc.bin \
    device/samsung/spica/prebuilt/wifi/nvram_mfg.txt:system/etc/nvram_mfg.txt \
    device/samsung/spica/prebuilt/wifi/rtecdc_mfg.bin:system/etc/rtecdc_mfg.bin \
    device/samsung/spica/prebuilt/wifi/bcm_supp.conf:system/etc/bcm_supp.conf \
    device/samsung/spica/prebuilt/wifi/wifi.conf:system/etc/wifi.conf \
    device/samsung/spica/prebuilt/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/spica/prebuilt/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/spica/prebuilt/wifi/wlservice:system/bin/wlservice \
    device/samsung/spica/prebuilt/wifi/wpa_supplicant:system/bin/wpa_supplicant

#
# Display (2D)
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/gralloc-libs/libs3c2drender.so:system/lib/libs3c2drender.so \
    device/samsung/spica/prebuilt/gralloc-libs/libsavscmn.so:system/lib/libsavscmn.so \
    device/samsung/spica/prebuilt/gralloc-libs/hw/gralloc.GT-I5700.so:system/lib/hw/gralloc.GT-I5700.so

#
# Display (3D)
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/spica/prebuilt/egl/libChunkAlloc.so:system/lib/egl/libChunkAlloc.so \
    device/samsung/spica/prebuilt/egl/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/spica/prebuilt/egl/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/spica/prebuilt/egl/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/keys/s3c-keypad-rev0020.kl:system/usr/keylayout/s3c-keypad-rev0020.kl \
    device/samsung/spica/prebuilt/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/spica/prebuilt/keys/s3c-keypad-rev0020.kcm.bin:system/usr/keychars/s3c-keypad-rev0020.kcm.bin

#
# Sensors, Lights etc
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/hw/copybit.GT-I5700.so:system/lib/hw/copybit.GT-I5700.so \
    device/samsung/spica/prebuilt/hw/lights.GT-I5700.so:system/lib/hw/lights.GT-I5700.so

#    device/samsung/spica/prebuilt/hw/sensors.GT-I5700.so:system/lib/hw/sensors.GT-I5700.so 

#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/vold/vold.fstab:system/etc/vold.fstab

#
# RIL
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/ril/drexe:system/bin/drexe \
    device/samsung/spica/prebuilt/ril/efsd:system/bin/efsd \
    device/samsung/spica/prebuilt/ril/rilclient-test:system/bin/rilclient-test \
    device/samsung/spica/prebuilt/ril/libsec-ril.so:system/lib/libsec-ril.so

#
# Audio
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/audio/asound.conf:system/etc/asound.conf


ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/spica/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# we have enough storage space to hold precise GC data
#PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m

# Vibrant uses high-density artwork where available
PRODUCT_LOCALES := mdpi

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_spica
PRODUCT_DEVICE := spica
PRODUCT_MODEL := GT-I5700
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
