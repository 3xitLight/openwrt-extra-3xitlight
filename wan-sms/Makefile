include $(TOPDIR)/rules.mk

PKG_NAME:=wan-sms
PKG_VERSION:=2020-04-25
PKG_RELEASE=1
PKG_MAINTAINER:=3XITLIGHT <3xitlight@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/wan-sms
PKG_SOURCE:=wan-sms.tar.gz
PKG_SOURCE_URL:=https://github.com/3xitLight/share/releases/download/1/
# PKG_HASH:=d8f6826a5d9dda0a4b0fae2be987ed157a5d833601d2595f5c65dee16a147f5c

include $(INCLUDE_DIR)/package.mk

define Package/wan-sms
    SECTION:=3xitlight
    CATEGORY:=3xitlight
	DEPENDS:=+kmod-usb2 +kmod-usb-ohci +kmod-usb-serial +kmod-usb-serial-option +usbutils +usb-modeswitch +kmod-usb-storage +kmod-scsi-core +kmod-scsi-cdrom +kmod-scsi-generic
    TITLE:=send wan status updates via sms
	PKGARCH:=all
	
endef

define Build/Compile
        true
endef

define Package/wan-sms/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/wan-sms $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/sms-up $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/sms-down $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/wan-sms.init $(1)/etc/init.d/wan-sms
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface/
	$(INSTALL_BIN) ./files/99-wan-sms $(1)/etc/hotplug.d/iface
endef

define Package/wan-sms/postinst
	#!/bin/sh
	# check if we are on real system
	if [ -z "$${IPKG_INSTROOT}" ]; then
		/etc/init.d/wan-sms enable
		/etc/init.d/wan-sms start
	fi
	exit 0
endef

$(eval $(call BuildPackage,wan-sms))
