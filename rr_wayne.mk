#
# Copyright (C) 2018 The Xiaomi-SDM660 Project
# Copyright (C) 2020 The Resurrection Remix Project
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

# Buildtype
RR_BUILDTYPE=Official

#Sign with private key
PRODUCT_DEFAULT_DEV_CERTIFICATE := device/xiaomi/wayne/keys/releasekey

# Inherit device configuration
$(call inherit-product, device/xiaomi/wayne/wayne_device.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/rr/config/common_full_phone.mk)

# Define first api level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Build Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="wayne-user 8.1.0 OPM1.171019.011 V9.5.11.0.ODCCNFA release-keys"

#Build FP to be picked by both system and vendor
BUILD_FINGERPRINT := xiaomi/wayne/wayne:8.1.0/OPM1.171019.011/V9.5.11.0.ODCCNFA:user/release-keys

# Device identifier
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := rr_wayne
PRODUCT_DEVICE := wayne
PRODUCT_MODEL := MI 6X
