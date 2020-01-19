# 
# Copyright (C) 2019 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=docker-engine
PKG_VERSION:=19.03.5
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-r0.apk
PKG_SOURCE_URL:=http://dl-cdn.alpinelinux.org/alpine/v3.11/community/armhf
PKG_HASH:=0c6f66ea6488fada97232bb679ca74f749c120c37d3255f2ecd1e0236561a25e

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/docker-engine
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Docker
	URL:=https://www.docker.com
	DEPENDS:=	+libdevmapper +libltdl +kmod-veth +kmod-ipt-extra +iptables-mod-extra \
				+ca-certificates +busybox +containerd
endef

define Package/docker-engine/description
	Docker Engine (dockerd)
endef

define Package/docker-engine/conffiles
	/etc/config/docker
endef

define Package/docker-engine/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/docker-proxy $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/dockerd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/docker $(1)/etc/config/docker
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/docker $(1)/etc/init.d/docker
endef

define Package/docker-engine/postinst
	#!/bin/sh
	echo "Configuring docker-init"
	ln -s /sbin/tini-static /usr/bin/docker-init
	exit 0
endef

define Package/docker-engine/prerm
	#!/bin/sh
	echo "Removing docker-init"
	rm /usr/bin/docker-init
	exit 0
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
    rm -rf $(PKG_BUILD_DIR)/*
endef


$(eval $(call BuildPackage,docker-engine))
