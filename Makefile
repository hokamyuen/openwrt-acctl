include $(TOPDIR)/rules.mk

PKG_NAME:=acctl
PKG_VERSION:=1.0
PKG_RELEASE:=0
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hokamyuen/acctl.git
PKG_SOURCE_VERSION:=b41766dc0ca859fd99f606c2d30015e36f8e2862

include $(INCLUDE_DIR)/package.mk

define Package/acctl_ac
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ac controller
  DEPENDS:=+zlib +libpthread +libmysqlclient
endef

define Package/acctl_ap
  SECTION:=net
  CATEGORY:=Network
  TITLE:=acctl client
  DEPENDS:=+zlib +libpthread +libmysqlclient
endef

define Package/acctl_test
  SECTION:=net
  CATEGORY:=Network
  TITLE:=acctl client
  DEPENDS:=+zlib +libpthread +libmysqlclient
endef

define Package/acctl_ac/description
	acctl is an ac controller for openwrt
endef

Package/acctl_ap/description = $(Package/acctl_ac/description)

Package/acctl_test/description = $(Package/acctl_ac/description)

define Package/acctl_ac/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ac/acser $(1)/bin/
endef

define Package/acctl_ap/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ap/apctl $(1)/bin/
endef

define Package/acctl_test/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/test/dll{ser,cli} $(1)/bin/
endef

$(eval $(call BuildPackage,acctl_ac))
$(eval $(call BuildPackage,acctl_ap))
$(eval $(call BuildPackage,acctl_test))
