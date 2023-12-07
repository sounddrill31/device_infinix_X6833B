#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),X6833B)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

DISPLAY_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek

$(DISPLAY_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf $(TARGET_BOARD_PLATFORM)/$(notdir $@).$(TARGET_BOARD_PLATFORM) $@

VENDOR_PLATFORM_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/vendor.txt)))
$(VENDOR_PLATFORM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $(notdir $@)"
	@ln -sf $(TARGET_BOARD_PLATFORM)/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(DISPLAY_SYMLINKS) \
	$(VENDOR_PLATFORM_SYMLINKS)

endif
