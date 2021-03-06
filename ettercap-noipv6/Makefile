#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# libpcap libnet libpthread zlib curl libbsd libltdl libpcre ncurses libbsd libcurl4 libluajit libncurses  libpcap libpcre 

include $(TOPDIR)/rules.mk

PKG_NAME:=ettercap-noipv6
PKG_VERSION:=0.8.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Ettercap/ettercap/releases/download/v$(PKG_VERSION)/
PKG_HASH:=0a5caa838928467619aacaa0009e46567b8c87314e89dd724b5ddfd948bc42e3
PKG_LICENSE:=GPL-3.0
CMAKE_OPTIONS:=-DENABLE_GTK=Off -DINSTALL_DESKTOP=Off -DENABLE_LUA=On -DENABLE_TESTS=On -DENABLE_GEOIP=Off -DENABLE_PDF_DOCS=Off -DENABLE_IPV6=off -DBUNDLED_LIBS=Off -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CROSSCOMPILING=True

include $(INCLUDE_DIR)/package.mk
# include $(INCLUDE_DIR)/cmake.mk

define Package/ettercap-noipv6
  SECTION:=3xitlight
  CATEGORY:=3xitlight
  TITLE:=a suite for man in the middle attacks, NoIPv6 support.
  URL:=https://www.ettercap-project.org
  MAINTAINER:=3xitlight <3xitlight@gmail.com>
  DEPENDS:=+check +luajit +libc +libstdcpp +uclibcxx +libgcc +uclibcxx +libpcre +libncurses +libpcrecpp +libltdl +libpcap +libnet-1.2.x +libopenssl +libpthread +zlib +zlib-dev +curl +libcurl
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(DL_DIR)/$(PKG_SOURCE) $(PKG_BUILD_DIR)
	$(PKG_UNPACK)
	mkdir -p $(PKG_BUILD_DIR)/build
	mkdir -p $(PKG_BUILD_DIR)/ipkg-install
endef

define Build/Configure
  IN_OPENWRT=1 \
  AR="$(TARGET_CROSS)ar" \
  AS="$(TARGET_CC) -c $(TARGET_CFLAGS)" \
  LD="$(TARGET_CROSS)ld" \
  NM="$(TARGET_CROSS)nm" \
  CC="$(TARGET_CC)" \
  GCC="$(TARGET_CC)" \
  CXX="$(TARGET_CROSS)g++" \
  RANLIB="$(TARGET_CROSS)ranlib" \
  STRIP="$(TARGET_CROSS)strip" \
  OBJCOPY="$(TARGET_CROSS)objcopy" \
  OBJDUMP="$(TARGET_CROSS)objdump" \
  TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
  TARGET_CFLAGS="$(TARGET_CFLAGS)" \
  TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
  cmake -S $(PKG_BUILD_DIR) -B $(PKG_BUILD_DIR)/build $(CMAKE_OPTIONS)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/build
	$(STRIP) $(PKG_BUILD_DIR)/build/src/ettercap
	$(STRIP) $(PKG_BUILD_DIR)/build/utils/etterfilter
	$(STRIP) $(PKG_BUILD_DIR)/build/utils/etterlog
endef

define Package/ettercap-noipv6/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/ettercap $(1)/usr/bin/ettercap
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/utils/etterfilter $(1)/usr/bin/etterfilter
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/utils/etterlog $(1)/usr/bin/etterlog
	$(INSTALL_DIR) $(1)/etc/ettercap
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.conf $(1)/etc/ettercap/etter.conf
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.dns $(1)/etc/ettercap/etter.dns
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.mdns $(1)/etc/ettercap/etter.mdns
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.nbns $(1)/etc/ettercap/etter.nbns
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/libettercap.so $(1)/usr/lib/libettercap.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/libettercap.so.0 $(1)/usr/lib/libettercap.so.0
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/libettercap.so.0.8.2 $(1)/usr/lib/libettercap.so.0.8.2
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/interfaces/libettercap-ui.so $(1)/usr/lib/libettercap-ui.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/interfaces/libettercap-ui.so.0 $(1)/usr/lib/libettercap-ui.so.0
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/src/interfaces/libettercap-ui.so.0.8.2 $(1)/usr/lib/libettercap-ui.so.0.8.2
	$(LN) /usr/lib/libpcap.so. $(1)/usr/lib/libpcap.so.1
	$(LN) /usr/lib/libncursesw.so.6.1 $(1)/usr/lib/libncursesw.so
	$(LN) /usr/lib/libcrypto.so.1.1  $(1)/usr/lib/libcrypto.so
	$(LN) /usr/lib//usr/lib/libssl.so.1.1 $(1)/usr/lib/libssl.so
	$(INSTALL_DIR) $(1)/usr/share/ettercap
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etterlog.dtd $(1)/usr/share/ettercap/etterlog.dtd
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.fields $(1)/usr/share/ettercap/etter.fields
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.filter $(1)/usr/share/ettercap/etter.filter
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.filter.examples $(1)/usr/share/ettercap/etter.filter.examples
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.filter.kill $(1)/usr/share/ettercap/etter.filter.kill
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.filter.pcre $(1)/usr/share/ettercap/etter.filter.pcre
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.filter.ssh $(1)/usr/share/ettercap/etter.filter.ssh
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.finger.os $(1)/usr/share/ettercap/etter.finger.os
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.mime $(1)/usr/share/ettercap/etter.mime
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.services $(1)/usr/share/ettercap/etter.services
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etterfilter.cnt $(1)/usr/share/ettercap/etterfilter.cnt
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etterfilter.tbl $(1)/usr/share/ettercap/etterfilter.tbl
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.finger.mac $(1)/usr/share/ettercap/etter.finger.mac
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/etter.ssl.crt $(1)/usr/share/ettercap/etter.ssl.crt
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/ettercap.svg $(1)/usr/share/ettercap/ettercap.svg
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/ettercap-small.png $(1)/usr/share/ettercap/ettercap-small.png
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/share/ettercap.png $(1)/usr/share/ettercap/ettercap.png
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/LICENSE $(1)/usr/share/ettercap/LICENSE
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/AUTHORS $(1)/usr/share/ettercap/AUTHORS
	$(INSTALL_DIR) $(1)/usr/lib/ettercap
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_arp_cop.so $(1)/usr/lib/ettercap/ec_arp_cop.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_autoadd.so $(1)/usr/lib/ettercap/ec_autoadd.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_chk_poison.so $(1)/usr/lib/ettercap/ec_chk_poison.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_dns_spoof.so $(1)/usr/lib/ettercap/ec_dns_spoof.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_dos_attack.so $(1)/usr/lib/ettercap/ec_dos_attack.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_dummy.so $(1)/usr/lib/ettercap/ec_dummy.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_find_conn.so $(1)/usr/lib/ettercap/ec_find_conn.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_find_ettercap.so $(1)/usr/lib/ettercap/ec_find_ettercap.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_find_ip.so $(1)/usr/lib/ettercap/ec_find_ip.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_finger.so $(1)/usr/lib/ettercap/ec_finger.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_finger_submit.so $(1)/usr/lib/ettercap/ec_finger_submit.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_fraggle_attack.so $(1)/usr/lib/ettercap/ec_fraggle_attack.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_gre_relay.so $(1)/usr/lib/ettercap/ec_gre_relay.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_gw_discover.so $(1)/usr/lib/ettercap/ec_gw_discover.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_isolate.so $(1)/usr/lib/ettercap/ec_isolate.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_krb5_downgrade.so $(1)/usr/lib/ettercap/ec_krb5_downgrade.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_link_type.so $(1)/usr/lib/ettercap/ec_link_type.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_mdns_spoof.so $(1)/usr/lib/ettercap/ec_mdns_spoof.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_nbns_spoof.so $(1)/usr/lib/ettercap/ec_nbns_spoof.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_pptp_chapms1.so $(1)/usr/lib/ettercap/ec_pptp_chapms1.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_pptp_clear.so $(1)/usr/lib/ettercap/ec_pptp_clear.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_pptp_pap.so $(1)/usr/lib/ettercap/ec_pptp_pap.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_pptp_reneg.so $(1)/usr/lib/ettercap/ec_pptp_reneg.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_rand_flood.so $(1)/usr/lib/ettercap/ec_rand_flood.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_remote_browser.so $(1)/usr/lib/ettercap/ec_remote_browser.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_reply_arp.so $(1)/usr/lib/ettercap/ec_reply_arp.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_repoison_arp.so $(1)/usr/lib/ettercap/ec_repoison_arp.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_scan_poisoner.so $(1)/usr/lib/ettercap/ec_scan_poisoner.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_search_promisc.so $(1)/usr/lib/ettercap/ec_search_promisc.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_smb_clear.so $(1)/usr/lib/ettercap/ec_smb_clear.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_smb_down.so $(1)/usr/lib/ettercap/ec_smb_down.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_smurf_attack.so $(1)/usr/lib/ettercap/ec_smurf_attack.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_sslstrip.so $(1)/usr/lib/ettercap/ec_sslstrip.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/plug-ins/ec_stp_mangler.so $(1)/usr/lib/ettercap/ec_stp_mangler.so
	$(INSTALL_DIR) $(1)/usr/share/man/man5
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/man/etter.conf.5 $(1)/usr/share/man/man5/etter.conf.5
	$(INSTALL_DIR) $(1)/usr/share/man/man8
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/man/ettercap.8 $(1)/usr/share/man/man8/ettercap.8
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/man/ettercap_curses.8 $(1)/usr/share/man/man8/ettercap_curses.8
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/man/ettercap_plugins.8 $(1)/usr/share/man/man8/ettercap_plugins.8
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/man/etterfilter.8 $(1)/usr/share/man/man8/etterfilter.8
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/man/etterlog.8 $(1)/usr/share/man/man8/etterlog.8
endef


$(eval $(call BuildPackage,ettercap-noipv6))
