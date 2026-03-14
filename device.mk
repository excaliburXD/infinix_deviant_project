#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    preloader \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# API
PRODUCT_SHIPPING_API_LEVEL := 28
BOARD_VNDK_VERSION := current

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-mtkimpl \
    android.hardware.boot@1.1-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# create_pl_dev
PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Additional Configs
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.0 \
    libkeymaster4 \
    libkeymaster41 \
    libkeymaster4support \
    libkeymaster4_1support \
    libkeymaster_messages \
    libkeymaster_portable \
    libpuresoftkeymasterdevice \
    libhwbinder \
    libhidltransport \
    libhardware \
    libhidlbase \
    libutils

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.0 \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4support.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4_1support.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhwbinder.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidltransport.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhardware.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlbase \
    $(TARGET_OUT_SHARED_LIBRARIES)/libutils