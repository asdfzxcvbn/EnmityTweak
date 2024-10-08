ARCHS := arm64
TARGET := iphone:clang:latest:8.0
INSTALL_TARGET_PROCESSES = Discord

include $(THEOS)/makefiles/common.mk

DEBUG_IP = 192.168.50.114
TWEAK_NAME = Enmity
DEVTOOLS = 0
Enmity_FILES = $(shell find src -name "*.x" && find src -name "*.xi")
Enmity_CFLAGS = -DDEBUG_IP=@\"$(DEBUG_IP)\" -DDEVTOOLS=$(DEVTOOLS) -fobjc-arc -Wno-module-import-in-extern-c
Enmity_FRAMEWORKS = UIKit Foundation CoreGraphics CoreImage

BUNDLE_NAME = EnmityFiles
EnmityFiles_INSTALL_PATH = "$(THEOS_PACKAGE_INSTALL_PREFIX)/Library/Application\ Support/Enmity"

ifeq ($(SIDELOAD),1)
Enmity_FILES += SideloadFix.xm
endif

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/bundle.mk
