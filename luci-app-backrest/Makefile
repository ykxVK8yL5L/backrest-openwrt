####
 #  File: /Makefile
 #  Project: luci-app-backrest
 #  File Created: Wednesday, 9th October 2019 1:39:36 pm
 #  Author: Gareth[EH](garethgeorge97@gmail.com)
 #  License: GNU General Public License v3.0 or later(http://www.gnu.org/licenses/gpl-3.0-standalone.html)
 #  Copyright (C) 2019 [Gareth]
####

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for backrest
LUCI_DEPENDS:=+backrest 
LUCI_PKGARCH:=all
PKG_NAME:=luci-app-backrest
PKG_VERSION:=1.0.1
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3.0+
PKG_MAINTAINER:=Gareth <garethgeorge97@gmail.com>

define Package/luci-app-backrest/description
	LuCI support for backrest. 
	Backrest is a web-accessible backup solution built on top of restic.   
	Backrest provides a WebUI which wraps the restic CLI and makes it easy to create repos, browse snapshots, and restore files. Additionally, Backrest can run in the background and take an opinionated approach to scheduling snapshots and orchestrating repo health operations.
endef

define Package/luci-app-backrest/conffiles
/etc/config/backrest
endef

include $(TOPDIR)/feeds/luci/luci.mk
# call BuildPackage - OpenWrt buildroot signature
