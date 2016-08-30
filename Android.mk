# Copyright (C) 2015 The Android Open Source Project
LOCAL_PATH := $(call my-dir)

common_c_includes := $(LOCAL_PATH)/lib
common_src_files :=  \
    lib/lz4.c \
    lib/lz4frame.c \
    lib/lz4hc.c \
    lib/xxhash.c \
    programs/lz4io.c

include $(CLEAR_VARS)
LOCAL_MODULE := liblz4
LOCAL_MULTILIB := both
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(common_c_includes)
include $(BUILD_HOST_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := liblz4
LOCAL_MULTILIB := both
LOCAL_WHOLE_STATIC_LIBRARIES := liblz4
LOCAL_EXPORT_C_INCLUDE_DIRS := $(common_c_includes)
include $(BUILD_HOST_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := liblz4
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(common_c_includes)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := liblz4
LOCAL_WHOLE_STATIC_LIBRARIES := liblz4
LOCAL_EXPORT_C_INCLUDE_DIRS := $(common_c_includes)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := lz4
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_STATIC_LIBRARIES := liblz4-static

LOCAL_SRC_FILES := \
    programs/bench.c \
    programs/lz4cli.c

include $(BUILD_EXECUTABLE)
