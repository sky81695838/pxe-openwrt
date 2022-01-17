#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pxeboot
PKG_VERSION:=1
PKG_RELEASE:=0.1
PKG_ARCH:=all
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=pxeboot from TFTP
	MAINTAINER:=Sky
	DEPENDS:=
endef

define Package/$(PKG_NAME)/description
pxeboot
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/root
	$(INSTALL_DATA) ./files/*  $(1)/root/
	$(INSTALL_DIR) $(1)/root/pxelinux.cfg
	$(INSTALL_DATA) ./pxelinux.cfg/default  $(1)/root/pxelinux.cfg/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/ipxeboot $(1)/etc/uci-defaults/yyy-ipxeboot
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
