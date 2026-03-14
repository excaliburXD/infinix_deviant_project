#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from deviant device
$(call inherit-product, device/infinix/deviant/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := deviant
PRODUCT_NAME := twrp_deviant
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix deviant
PRODUCT_MANUFACTURER := INFINIX MOBILITY LIMITED
