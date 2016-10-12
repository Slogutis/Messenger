export THEOS =/var/theos
ARCHS = armv7 arm64 
export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000
DEBUG=0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Messenger+
Messenger+_FILES = Tweak.xm Palestine.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Messenger"
SUBPROJECTS += messenger
include $(THEOS_MAKE_PATH)/aggregate.mk
