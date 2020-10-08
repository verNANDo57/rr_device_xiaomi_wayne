#
# Copyright (C) 2018 The Xiaomi-SDM660 Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# EAS_POWERHINT_VARIANT
EAS_POWERHINT_VARIANT := sdm660

# Inherit the fusion-common definitions
$(call inherit-product, device/xiaomi/wayne-common/wayne_common.mk)

# Device Path
WAYNE_PATH := device/xiaomi/wayne

# Audio Configs
PRODUCT_COPY_FILES += \
    $(WAYNE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(WAYNE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Consumerir
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Device properties
$(call inherit-product, $(WAYNE_PATH)/wayne_prop.mk)

# HW crypto
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee

# Media
PRODUCT_COPY_FILES += \
    $(WAYNE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(WAYNE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Watermark
PRODUCT_COPY_FILES += \
    $(WAYNE_PATH)/configs/media/MIUI_DualCamera_watermark_6X.png:$(TARGET_COPY_OUT_VENDOR)/etc/MIUI_DualCamera_watermark.png

# Impositions
DEVICE_PACKAGE_OVERLAYS += \
    $(WAYNE_PATH)/overlay-device-specific \
    $(WAYNE_PATH)/overlay-RR-specific

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# SD Card
PRODUCT_CHARACTERISTICS := nosdcard

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service
    
# RR Wallpapers (optional)
BUILD_RR_WALLPAPERS:= true

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(WAYNE_PATH)

# Vendor files
$(call inherit-product, vendor/xiaomi/wayne/wayne-vendor.mk)

# AOSP DEVICE
PRODUCT_NAME := aosp_wayne
PRODUCT_DEVICE := wayne
PRODUCT_MODEL := Mi 6X (AOSP)
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
