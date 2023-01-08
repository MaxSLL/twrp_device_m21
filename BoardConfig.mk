#
# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

DEVICE_PATH := device/samsung/m21

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

# 2nd Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Silence warning build
TARGET_SUPPORTS_64_BIT_APPS := true

# CPUSets and Sched
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
#TARGET_OTA_ASSERT_DEVICE := m21

ALLOW_MISSING_DEPENDENCIES := true

# Prebuilt: Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Prebuilt: DTB
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Prebuilt: DTBO
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true

# Kernel: Base flags
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg/mkbootimg.mk
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_BOOT_HEADER_VERSION := 2

# Kernel: Board (kernel...) flags
BOARD_NAME                 := SRPSL26A003RU
BOARD_KERNEL_BASE          := 0x10000000
BOARD_KERNEL_PAGESIZE      := 2048
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_RAMDISK_OFFSET       := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0xf0000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_DTB_OFFSET           := 0x00000000

# Kernel: mkbootimgs args
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --board $(BOARD_NAME)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --recovery_dtbo $(BOARD_PREBUILT_DTBOIMAGE)

# Platform: Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := universal9611

# Platform: Board
TARGET_BOARD_PLATFORM_GPU := mali-g72

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_FLASH_BLOCK_SIZE := 131072
#BOARD_HAS_NO_REAL_SDCARD := true
LZMA_RAMDISK_TARGETS := recovery
RECOVERY_SDCARD_ON_DATA := true
BOARD_RAMDISK_USE_LZMA := true

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_BOOTIMAGE_PARTITION_SIZE     := 56623104
BOARD_DTBOIMAGE_PARTITION_SIZE     := 8388608

# File systems: Partitions
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE     := ext4

# FIle systems: Available types
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Always use mke2fs
TARGET_USES_MKE2FS := true

# Target copy out
TARGET_COPY_OUT_VENDOR := vendor

# Dynamic partitions
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_SUPER_PARTITION_SIZE := 6382682112
BOARD_MAIN_SIZE := 6382682112
BOARD_MAIN_PARTITION_LIST := system odm vendor product

# Use extra folders
BOARD_ROOT_EXTRA_FOLDERS := cache carrier data_mirror efs keyrefuge linkerconfig metadata omr optics prism spu

# Use simple discard (Faster)
BOARD_SUPPRESS_SECURE_ERASE := true

# Use extra props for build.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Encryption: Setup it
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_METADATA_PARTITION := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false

# TWRP Configuration: Basic config
TW_THEME := portrait_hdpi
TW_EXCLUDE_TWRPAPP := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_EXFAT_FUSE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_NEW_MINADBD := true
TW_USE_SAMSUNG_HAPTICS := true
TW_EXCLUDE_APEX := true
TW_USE_TOOLBOX := true
TW_Y_OFFSET := 100
TW_H_OFFSET := -100

# TWRP Configuration: Logd
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# PBRP specific flags
#PB_DISABLE_DEFAULT_DM_VERITY := true
#PB_TORCH_PATH := "/sys/devices/virtual/camera/flash/rear_flash"
#PB_TORCH_MAX_BRIGHTNESS := 1
