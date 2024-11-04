####
 #  File: /Makefile
 #  Project: backrest
 #  File Created: Friday, 11th October 2019 4:50:49 pm
 #  Author: Gareth[EH](garethgeorge97@gmail.com)
 #  License: GNU General Public License v3.0 or later(http://www.gnu.org/licenses/gpl-3.0-standalone.html)
 #  Copyright (C) 2019 [Gareth]
####

include $(TOPDIR)/rules.mk

PKG_NAME:=backrest
PKG_VERSION:=1.6.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/garethgeorge/backrest.git
PKG_SOURCE_DATE:=2024-10-20
#PKG_SOURCE_VERSION:=
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_MIRROR_HASH:=

PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=Gareth <garethgeorge97@gmail.com>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0 # https://github.com/openwrt/packages/issues/8498
GO_PKG:=github.com/garethgeorge/backrest
GO_PKG_EXCLUDES:=test

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

# GO_PKG_LDFLAGS:=
GO_PKG_LDFLAGS_X:=\
	main.Version=v$(PKG_VERSION) \
	main.BuildUser=openwrt \
	main.BuildHost=openwrt \
	main.BuildStamp=$(SOURCE_DATE_EPOCH)

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=a web-accessible backup solution built on top of restic.
	URL:=https://github.com/garethgeorge/backrest
  	DEPENDS:=+restic 
endef

define Package/$(PKG_NAME)/description
Backrest is a web-accessible backup solution built on top of restic.   
Backrest provides a WebUI which wraps the restic CLI and makes it easy to create repos, browse snapshots, and restore files. Additionally, Backrest can run in the background and take an opinionated approach to scheduling snapshots and orchestrating repo health operations.
endef

define Package/$(PKG_NAME)/install
	# echo "++++++++++++++++++"
	# echo "$(PKG_INSTALL_DIR)"
	# echo "$(1)"
	# echo "$(GO_PKG_BUILD_BIN_DIR)"
	# echo "++++++++++++++++++"

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/backrest $(1)/usr/bin/
endef

$(eval $(call GoBinPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
