#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

openClash_url='https://github.com/vernesong/OpenClash.git'       # OpenClash包地址
lienol_url='https://github.com/Lienol/openwrt-package.git'       # Lienol 包地址
filter_url='https://github.com/destan19/OpenAppFilter.git'       # AppFilter 地址

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

git clone https://github.com/siropboy/mypackages package/mypackages

#echo '添加OpenClash'
git clone $openClash_url package/lean/luci-app-openclash
#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y'  >> .config

#echo '添加OpenAppFilter过滤器'
#git clone $filter_url package/OpenAppFilter
#echo 'CONFIG_PACKAGE_luci-app-oaf=y' >> .config
#echo 'CONFIG_PACKAGE_kmod-oaf=y' >> .config
#echo 'CONFIG_PACKAGE_appfilter=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y'  >> .config

#echo '添加Lienol包'
git clone $lienol_url package/Lienol

#echo '添加Passwall'
#echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y' >> .config
#echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y'  >> .config

#echo '添加filebrowser'
#echo 'CONFIG_PACKAGE_luci-app-filebrowser=y' >> .config
#echo 'CONFIG_PACKAGE_luci-i18n-filebrowser-zh-cn=y'  >> .config
