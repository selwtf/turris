# 
# Copyright (C) 2019 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=docker
PKG_VERSION:=19.03.5
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-r0.apk
PKG_SOURCE_URL:=http://dl-cdn.alpinelinux.org/alpine/v3.11/community/armhf
PKG_HASH:=bbdb17355f18ba61a2c9d93dcf209ca37e9aa2622b846a714644692460b7fa3c

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/docker
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Docker
	URL:=https://www.docker.com
	DEPENDS:=	+docker-engine +docker-cli \
				+busybox
endef

define Package/docker/description
	Pack, ship and run any application as a lightweight container
endef

define Package/docker/preinst
	#!/bin/sh
	echo "Adding docker usergroup"
	groupadd -r docker
	exit 0
endef

define Package/docker/install
	$(INSTALL_DIR) $(1)/usr/bin
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/* $(1)/usr/bin/
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
    rm -rf $(PKG_BUILD_DIR)/*
endef


$(eval $(call BuildPackage,docker))
