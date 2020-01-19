# 
# Copyright (C) 2020 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tini-static
PKG_VERSION:=0.18.0
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-r0.apk
PKG_SOURCE_URL:=http://dl-cdn.alpinelinux.org/alpine/v3.11/community/armhf
PKG_HASH:=9d6056f19c422be4c491f24aacfd1914015f90c5052f455326ca4fa6a3cc5690

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/tini-static
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Tini
	URL:=https://github.com/krallin/tini
	DEPENDS:=
endef

define Package/tini-static/description
	Static build of tini
endef

define Package/tini-static/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sbin/* $(1)/sbin/
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
	rm -rf $(PKG_BUILD_DIR)/*
endef


$(eval $(call BuildPackage,tini-static))
