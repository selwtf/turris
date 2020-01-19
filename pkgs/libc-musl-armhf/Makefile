# 
# Copyright (C) 2019 Daniel Sel
#
# This is free software, licensed under the Apache License 2.0.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libc-musl-armhf
PKG_VERSION:=0.0.0
PKG_RELEASE:=0

UNPACK_CMD=tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)

include $(INCLUDE_DIR)/package.mk

define Package/libc-musl-armhf
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=libc (musl-armhf meta pkg)
	URL:=
	DEPENDS:=
	PROVIDES:=libc-musl-armhf
endef

define Package/libc-musl-armhf/description
	Meta package providing the dependency to libc.musl-armhf for precompiled Alpine Linux binaries that depend on it.
	Only installs on Routers that are based on > ARMv7
endef

define Package/libc-musl-armhf/preinst
#!/bin/sh
echo "Checking for libc.musl-armhf..."
if [ -e /lib/libc.musl-armhf.so.1 ] || [ -L /lib/libc.musl-armhf.so.1 ]; then
	echo "libc.musl-armhf found."
	exit 0
elif [ -e /lib/ld-musl-armhf.so.1 ] || [ -L /lib/ld-musl-armhf.so.1 ]; then
	echo "libc.musl-armhf not found, but ld-musl-armhf.so.1 found. Creating symlink..."
	ln -s /lib/libc.so /lib/libc.musl-armhf.so.1 &&\
	echo "Done" &&\
	exit 0
else
	echo "libc.musl-armhf not found. Aborting install."
	exit 1
fi
endef

define Package/libc-musl-armhf/install
	# (HACK/INFO) This actually does nothing, it's just here as a reference for packages using it.
	echo "libc.musl-armhf.so.1" > $(PKG_INFO_DIR)/$(PKG_NAME).provides
endef

define Build/Prepare
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
endef

$(eval $(call BuildPackage,libc-musl-armhf))
