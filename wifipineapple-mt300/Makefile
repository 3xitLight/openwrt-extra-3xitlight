include $(TOPDIR)/rules.mk

PKG_NAME:=wifipineapple-mt300
PKG_VERSION:=2020-04-25
PKG_RELEASE=1
PKG_MAINTAINER:=3XITLIGHT <3xitlight@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/wifipineapple-mt300
PKG_SOURCE:=wifipineapple-mt300.tar.gz
PKG_SOURCE_URL:=https://github.com/3xitLight/share/releases/download/1/

define Package/wifipineapple-mt300
SECTION:=3xitlight
CATEGORY:=3xitlight
TITLE:=wifipineapple-mt300
DEPENDS:=+bash +netcat php7-cgi +php7-fpm +dnsmasq +nginx +openssh-server
endef

include $(INCLUDE_DIR)/package.mk
	
define Package/wifipineapple-mt300/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/etc/banner $(1)/etc
	$(INSTALL_CONF) ./files/etc/php.ini $(1)/etc
	$(INSTALL_CONF) ./files/etc/php7-fpm.conf $(1)/etc
	$(INSTALL_CONF) ./files/etc/rc.local $(1)/etc
	$(INSTALL_CONF) ./files/etc/usb-mode.json $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/fstab $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/firewall $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/dnsmasq $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/sysctl $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/sshd $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/resetssids $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/pineapple $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/pineapd $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/php7-fpm $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/nginx $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/autossh $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/fastcgi_params $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/koi-utf $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/koi-win $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/mime.types $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/naxsi_core.rules $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/nginx.conf $(1)/etc/nginx
	$(INSTALL_CONF) ./files/etc/nginx/win-utf $(1)/etc/nginx
	$(INSTALL_DIR) $(1)/etc/opkg
	$(INSTALL_CONF) ./files/etc/opkg/customfeeds.conf $(1)/etc/opkg
	$(INSTALL_CONF) ./files/etc/opkg/distfeeds.conf $(1)/etc/opkg
	$(INSTALL_DIR) $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/15_openssl.ini $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/20_hash.ini $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/20_json.ini $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/20_mbstring.ini $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/20_session.ini $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/20_sockets.ini $(1)/etc/php7
	$(INSTALL_CONF) ./files/etc/php7/20_sqlite3.ini $(1)/etc/php7
	$(INSTALL_DIR) $(1)/etc/php7-fpm.d
	$(INSTALL_CONF) ./files/etc/php7-fpm.d/www.conf $(1)/etc/php7-fpm.d
	$(INSTALL_DIR) $(1)/etc/pineape
	$(INSTALL_CONF) ./files/etc/pineape/hostapd-pineape.eap_user $(1)/etc/pineape
	$(INSTALL_DIR) $(1)/etc/pineape/certs
	$(INSTALL_CONF) ./files/etc/pineape/certs/* $(1)/etc/pineape/certs/
	$(INSTALL_DIR) $(1)/etc/pineapple
	$(INSTALL_BIN) ./files/etc/pineapple/button_script $(1)/etc/pineapple
	$(INSTALL_BIN) ./files/etc/pineapple/tracking_script_user $(1)/etc/pineapple
	$(INSTALL_BIN) ./files/etc/pineapple/tracking_script $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/changes $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/init $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/landingpage.php $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/pineap_log_location $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/pineapple_version $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/setupRequired $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/pineap_pool_location $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/spoofhost	$(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/ssid_file $(1)/etc/pineapple
	$(INSTALL_CONF) ./files/etc/pineapple/tracking_list $(1)/etc/pineapple
	$(INSTALL_DIR) $(1)/etc/rc.button
	$(INSTALL_BIN) ./files/etc/rc.button/BTN_1 $(1)/etc/rc.button
	$(INSTALL_DIR) $(1)/etc/ssh
	$(INSTALL_CONF) ./files/etc/ssh/ssh_config $(1)/etc/ssh  
	$(INSTALL_CONF) ./files/etc/ssh/sshd_config $(1)/etc/ssh
	$(INSTALL_DIR) $(1)/etc/sysctl.d
	$(INSTALL_CONF) ./files/etc/sysctl.d/11-nf-conntrack.conf $(1)/etc/sysctl.d
	$(INSTALL_CONF) ./files/etc/sysctl.d/10-default.conf $(1)/etc/sysctl.d
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/90-firewall.sh $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/91-fstab.sh $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/92-system.sh $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/93-pineap.sh $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/95-network.sh $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/96-landingpage.sh $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/97-pineapple.sh $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/pineap $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/bin/pineapple
	$(INSTALL_BIN) ./files/usr/bin/pineapple/usb0_ping $(1)/usr/bin/pineapple
	$(INSTALL_BIN) ./files/usr/bin/pineapple/opkg $(1)/usr/bin/pineapple
	$(INSTALL_BIN) ./files/usr/bin/pineapple/module $(1)/usr/bin/pineapple
	$(INSTALL_CONF) ./files/usr/bin/pineapple/uds_send $(1)/usr/bin/pineapple
	$(INSTALL_CONF) ./files/usr/bin/pineapple/site_survey $(1)/usr/bin/pineapple
	$(INSTALL_CONF) ./files/usr/bin/pineapple/notify $(1)/usr/bin/pineapple
	$(INSTALL_CONF) ./files/usr/bin/pineapple/meterpreter $(1)/usr/bin/pineapple
	$(INSTALL_CONF) ./files/usr/bin/pineapple/generate_probe_report $(1)/usr/bin/pineapple
	$(INSTALL_DIR) $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/aireplay-ng $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/airmon-ng $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/airodump-ng $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/airodump-ng-oui-update $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/http_sniffer $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/pineapd $(1)/usr/sbin 
	$(INSTALL_BIN) ./files/usr/sbin/resetssids $(1)/usr/sbin 
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_CONF) ./files/www/index.php $(1)/www
endef


define Package/wifipineapple-mt300/postinst
	if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/nginx enable
	/etc/init.d/php7-fpm enable
	fi
	exit 0
endef

$(eval $(call BuildPackage,wifipineapple-mt300))
