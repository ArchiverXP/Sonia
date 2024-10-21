TARGET := iphone:clang:6.0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = ReSoniaDylib empty

ReSoniaDylib_FILES = ReSoniaDylib.c ReSoniaDylib.m

ReSoniaDylib_LDFLAGS = -Xlinker -reexport_library empty.dylib -current_version 1.0.0 -compatibility_version 1.0.0

ReSoniaDylib_INSTALL_PATH = /usr/local/lib


empty_FILES = empt.c

EMPTY_LDFLAGS = -Xlinker 

empty_INSTALL_PATH = /usr/local/lib


include $(THEOS_MAKE_PATH)/library.mk
