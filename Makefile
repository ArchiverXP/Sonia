TARGET := iphone:clang:latest:6.0

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = Sonia GameController Foundation

Sonia_FILES = main.c
Sonia_LDFLAGS = -current_version 1.0.0 -compatibility_version 1.0.0
Sonia_INSTALL_PATH = /usr/local/lib

GameController_FILES = GameController.x GameController.c
GameController_CFLAGS = -fobjc-arc
GameController_LDFLAGS = -current_version 1.0.0 -compatibility_version 1.0.0
GameController_INSTALL_PATH = /usr/local/lib

Foundation_FILES = Foundation.x
Foundation_CFLAGS = -fobjc-arc
Foundation_LDFLAGS = -current_version 300.0.0 -compatibility_version 300.0.0
Foundation_INSTALL_PATH = /usr/local/lib

include $(THEOS_MAKE_PATH)/library.mk
