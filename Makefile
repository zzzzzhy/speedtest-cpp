#
# Copyright (C) 2013-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=speedtest-cpp
PKG_VERSION:=1.0.1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/zzzzzhy/SpeedTest.git
PKG_SOURCE_VERSION:=ee449c6c0e509e3b4f88e8cf321f071e2222928e
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_LICENSE:=
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk #如果使用cmake，则必须增加此行

define Package/speedtest-cpp
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Speedtest Utility (c++, NO python)
	DEPENDS:=+libcurl +libxml2 +libopenssl +libstdcpp
endef

define Package/speedtest-cpp/description
	Speedtest utility written in c++ based on speedtest.net
endef

define Package/speedtest-cpp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/SpeedTest $(1)/usr/bin/speedtest_cpp
endef

$(eval $(call BuildPackage,speedtest-cpp))

