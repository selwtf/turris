# 
# Copyright (C) 2019 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=docker-cli
PKG_VERSION:=19.03.5
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-r0.apk
PKG_SOURCE_URL:=http://dl-cdn.alpinelinux.org/alpine/v3.11/community/armhf
PKG_HASH:=255b7ad2d552aef8e74f6a24f361f8cbf54c93161f85a8e96b2174fa0584d071

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/docker-cli
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Docker
	URL:=https://www.docker.com
	DEPENDS:=	+ca-certificates +libc-musl-armhf
endef

define Package/docker-cli/description
	19.03.5-r0
endef

define Package/docker-cli/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/* $(1)/usr/bin/
endef

define Build/Compile
	# HACK: Terrible hack
	# libc-musl-armhf creates a missing symlink since libc-musl is in a different place in OpenWRT (compared to alpine)
	# Unfourtunately, we don't compile it, so the linker cannot detect it as 'provides' output.
	# We can also not hack it in the libc-musl-armhf, since the linker overwrites the .provides file after all build targets have run
	# If anyone has a better idea -> GitHub Issue (better yet: PR)
	echo "libc.musl-armhf.so.1" > $(PKG_INFO_DIR)/libc-musl-armhf.provides
endef

define Build/Install
endef

define Build/Clean
    rm -rf $(PKG_BUILD_DIR)/*
endef


$(eval $(call BuildPackage,docker-cli))
