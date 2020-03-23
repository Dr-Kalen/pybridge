LOCAL_PATH := $(call my-dir)
RECIPES_PATH := $(LOCAL_PATH)/../../../../../recipes
PYTHON_PATH := $(RECIPES_PATH)/python3.8.2/Python-3.8.2


# Build libpybridge.so

include $(CLEAR_VARS)
LOCAL_MODULE    := pybridge
LOCAL_SRC_FILES := pybridge.c
LOCAL_LDLIBS := -llog
LOCAL_SHARED_LIBRARIES := python3.8
include $(BUILD_SHARED_LIBRARY)


# Include libpython3.8.so

include $(CLEAR_VARS)
LOCAL_MODULE    := python3.8
LOCAL_SRC_FILES := $(PYTHON_PATH)/libpython3.8.so
LOCAL_EXPORT_CFLAGS := -I $(PYTHON_PATH) -I $(PYTHON_PATH)/Include
include $(PREBUILT_SHARED_LIBRARY)
