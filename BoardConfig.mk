#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/water

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    vbmeta_system \
    boot \
    product \
    vbmeta_vendor \
    vendor
BOARD_USES_RECOVERY_AS_BOOT := true

# Build_hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := water
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
TARGET_KERNEL_CONFIG := water_defconfig # no file, only make build system happy
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel # automatically copied
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img # for mkbootimg only
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img # automatically copied
TARGET_FORCE_PREBUILT_KERNEL := true # dont really build with our imcomplete "source"

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_SUPER_PARTITION_SIZE := 3758096384 # TODO: Fix hardcoded value
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1392984064
BOARD_VENDORIMAGE_PARTITION_SIZE := 198541312
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 1163186176
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    product \
    vendor \
    system
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 3753902080 # TODO: Fix hardcoded value

# File systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor


# Platform
TARGET_BOARD_PLATFORM := mt6765

# Treble
BOARD_VNDK_VERSION  := current


# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/device/xiaomi/water/configs/props/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.enableswap
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6765
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2023-02-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.biometrics.fingerprint@2.1-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.boot@1.2.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.cas@1.2-service-lazy.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.dumpstate@1.1-service.xiaomi.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.health@2.1.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.security.keymint-service.mitee.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.security.secureclock-service.mitee.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.security.sharedsecret-service.mitee.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.usb@1.2-service-mediatekv2.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.wifi.hostapd.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.wifi.supplicant.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/android.hardware.wifi@1.0-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/gnss-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/gnss@2.1-service.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/lbs_hidl_service@1.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/lights-mtk-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest_android.hardware.drm@1.4-service.clearkey.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest_android.hardware.drm@1.4-service.widevine.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest_hwcomposer.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest_media_c2_V1_2_default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/power-default.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/vendor.xiaomi.hardware.misys@1.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/vendor.xiaomi.hardware.misys@2.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/vendor.xiaomi.hardware.misys@3.0.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/vibrator-mtk-default.xml

# SELinux
#include device/mediatek/sepolicy_vndr/SEPolicy.mk

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Inherit the proprietary files
include vendor/xiaomi/water/BoardConfigVendor.mk
