include $(TOPDIR)/rules.mk

PKG_NAME:=usbredir
PKG_VERSION:=0.13.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/freedesktop/spice-usbredir
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=5fc0e1c43194d948545941d408f4c10d084eb6ed

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/usbredir
	SECTION:=net
	CATEGORY:=Base system
	TITLE:=USB network redirection protocol libraries
	URL:=https://spice-space.org/
	DEPENDS:=+libusb-1.0 +glib2
endef

define Package/usbredir/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt-build/tools/usbredirect $(1)/usr/sbin/usbredirect
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/openwrt-build/usbredirhost/libusbredirhost.so.* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/openwrt-build/usbredirparser/libusbredirparser.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,usbredir))
