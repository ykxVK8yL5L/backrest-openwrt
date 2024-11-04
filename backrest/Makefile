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
#PKG_SOURCE_URL:=https://github.com/garethgeorge/backrest.git
# PKG_SOURCE_URL := https://github.com/garethgeorge/backrest/releases/download/v1.6.1
# PKG_SOURCE:=backrest_Linux_x86_64.tar.gz
# PKG_HASH=721856c8a5a59903ab22acc8cc57b042567bebe120b03576447b4b84f4861ad5
# PKG_LICENSE:=GPLv3
# PKG_MAINTAINER:=Gareth <garethgeorge97@gmail.com>


include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=a web-accessible backup solution built on top of restic.
  	DEPENDS:=+restic 
endef

define Package/$(PKG_NAME)/description
	Backrest is a web-accessible backup solution built on top of restic.   
endef


define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/backrest $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/backrest.init $(1)/etc/init.d/backrest
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/backrest.config $(1)/etc/config/backrest
endef


define Build/Compile
	echo "$(PKG_NAME) using precompiled binary."
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
