include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=usbredir
PKG_VERSION:=0.8.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/freedesktop/spice-usbredir
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=07b98b8e71f620dfdd57e92ddef6b677b259a092

include $(INCLUDE_DIR)/package.mk

define Package/usbredir
	SECTION:=net
	CATEGORY:=Base system
	TITLE:=USB network redirection protocol libraries
	URL:=https://spice-space.org/
	DEPENDS:=+libusb-1.0
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default)
endef

define Package/usbredir/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usbredirserver/.libs/usbredirserver $(1)/usr/sbin/usbredirserver
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/usbredirhost/.libs/libusbredirhost.so.* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/usbredirparser/.libs/libusbredirparser.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,usbredir))