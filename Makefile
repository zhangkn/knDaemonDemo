
THEOS_DEVICE_IP=usb2222	#5C9

ARCHS = armv7 armv7s arm64
TARGET = iphone:latest:8.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = knDaemonDemo
knDaemonDemo_FILES = main.mm

include $(THEOS_MAKE_PATH)/tool.mk

after-install::
	install.exec "echo '' > /var/log/syslog"
	install.exec "chown root:wheel /usr/bin/$(TOOL_NAME)"
	install.exec "chown root:wheel  /Library/LaunchDaemons/com.kn.$(TOOL_NAME).plist"
	install.exec "reboot"