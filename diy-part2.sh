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

# 获取luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/diy-packages/luci-app-adguardhome
# 获取hello world和依赖
git clone https://github.com/jerrykuku/lua-maxminddb package/diy-packages/helloworld/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/diy-packages/helloworld/luci-app-vssr
# 获取passwall
# git clone -b 3.6-40 https://github.com/liuran001/luci-app-passwall package/diy-packages/passwall
# 获取Lienol-package
git clone https://github.com/Lienol/openwrt-package package/diy-packages/lienol
# 获取luci-app-diskman和依赖
mkdir -p package/diy-packages/luci-app-diskman && \
mkdir -p package/diy-packages/parted && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Makefile -O package/diy-packages/luci-app-diskman/Makefile
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/diy-packages/parted/Makefile
# 获取luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan package/diy-packages/luci-app-serverchan
# 获取luci-app-openclash 编译po2lmo
git clone -b master https://github.com/vernesong/OpenClash package/diy-packages/openclash
pushd package/diy-packages/openclash/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
#=================================================
# 清除默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#=================================================
# 清除旧版argon主题并拉取最新版
pushd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
popd

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
