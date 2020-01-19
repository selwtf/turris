# 
# Copyright (C) 2020 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=containerd
PKG_VERSION:=1.3.2
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-r0.apk
PKG_SOURCE_URL:=http://dl-cdn.alpinelinux.org/alpine/v3.11/community/armhf
PKG_HASH:=f32139275dc9ef5d002bb0b941e428082ccffedba7c241aa984a7ba89c6e60d0

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/containerd
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=containerd
	URL:=https://containerd.io
	DEPENDS:=+libseccomp +runc
endef

define Package/containerd/description
	  An open and reliable container runtime
endef

define Package/containerd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/* $(1)/usr/bin/
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
	rm -rf $(PKG_BUILD_DIR)/*
endef


$(eval $(call BuildPackage,containerd))