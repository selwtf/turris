# 
# Copyright (C) 2021 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=k3s
PKG_VERSION:=v1.19.7+k3s1
PKG_RELEASE:=0

PKG_SOURCE:=k3s-armhf
PKG_SOURCE_URL:=https://github.com/k3s-io/k3s/releases/download/v1.19.7%2Bk3s1
PKG_HASH:=149fd13eb25bbade760e2c20e588869d0198bf0feedcadc16bf955821f45f3f6

UNPACK_CMD=mv $(DL_DIR)/$(PKG_SOURCE) $(PKG_BUILD_DIR)/k3s

include $(INCLUDE_DIR)/package.mk

define Package/k3s
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=K3s
	URL:=https://www.k3s.io/
	DEPENDS:=	+libdevmapper +libseccomp +kmod-veth +kmod-nf-ipvs +kmod-ipt-extra +iptables-mod-extra +ipset \
				+ca-certificates +busybox
endef

define Package/k3s/description
	Lightweight Kubernetes (k3s)
endef

define Package/k3s/conffiles
	/etc/config/k3s
endef

define Package/k3s/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/k3s $(1)/usr/bin/k3s
	$(INSTALL_DIR) $(1)/etc/sysctl.d
	$(INSTALL_DATA) ./files/etc/sysctl.d/21-k3s $(1)/etc/sysctl.d/21-k3s
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/k3s $(1)/etc/config/k3s
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/k3s $(1)/etc/init.d/k3s
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
    rm -rf $(PKG_BUILD_DIR)/*
endef


$(eval $(call BuildPackage,k3s))
