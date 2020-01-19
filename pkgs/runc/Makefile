# 
# Copyright (C) 2020 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=runc
PKG_VERSION:=1.0.0_rc9
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-r0.apk
PKG_SOURCE_URL:=http://dl-cdn.alpinelinux.org/alpine/v3.11/community/armhf
PKG_HASH:=b6cd6f038805eafff26d304bc506a6ca5c4f98a0d8875e09174f9ce728cf5900

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/runc
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=runC
	URL:=https://www.opencontainers.org
	DEPENDS:=+libc-musl-armhf +libseccomp
endef

define Package/runc/description
	CLI tool for spawning and running containers according to the OCI specification
endef

define Package/runc/install
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


$(eval $(call BuildPackage,runc))
