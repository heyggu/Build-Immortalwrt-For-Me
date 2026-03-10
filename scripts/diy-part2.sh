#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.82.1/192.168.82.254/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/ImmortalWrt/ImmortalWrt-$(shell TZ="Asia/Shanghai" date +"%Y%m%d")/g' package/base-files/files/bin/config_generate

# Modify filename, add date prefix
#sed -i 's|IMG_PREFIX:=|IMG_PREFIX:=AP-$(shell TZ="Asia/Shanghai" date +"%Y%m%d")-24.10-6.6|' include/image.mk

# Insert two lines before the last line in 99-default-settings-chinese. For Modify opkg url, change mt7981 to filogic, del lines inlude passwall.
# filesDAFA sed -i '/^exit 0$/i sed -i "s,mt7981,filogic,g" "package/base-files/files/etc/opkg/distfeeds.conf"\nsed -i '\''/passwall/d'\'' "package/base-files/files/etc/opkg/distfeeds.conf"' package/emortal/default-settings/files/99-default-settings-chinese
# 1. 删除 feeds 中旧的 golang
rm -rf feeds/packages/lang/golang

# 2. 拉取最新的 golang 
git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang

# 3. 重新安装 golang 包以更新索引
./scripts/feeds install -p packages golang
find package/tailscale -type f -name Makefile -exec sed -i '/\/builder/d' {} +

# UPX 
upx_latest_ver=$(curl -s https://api.github.com/repos/upx/upx/releases/latest | grep 'tag_name' | cut -d\" -f4)
upx_ver_num=${upx_latest_ver#v}
upx_url="https://github.com/upx/upx/releases/download/${upx_latest_ver}/upx-${upx_ver_num}-amd64_linux.tar.xz"
echo "Downloading UPX ${upx_latest_ver} from ${upx_url} ..."
mkdir -p upx
curl -L "$upx_url" | tar -xJ -C upx --strip-components=1
chmod +x upx/upx