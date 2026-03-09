#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
# natmapt
#git clone #git clone --depth 1 --branch master --single-branch https://github.com/muink/luci-app-natmapt.git package/luci-
#git clone #git clone --depth 1 --branch master --single-branch https://github.com/muink/openwrt-natmapt.git pack
git clone --depth 1 --branch master --single-branch https://github.com/heyggu/luci-app-natmapt.git package/luci-app-natmapt
git clone --depth 1 --branch master --single-branch https://github.com/heyggu/openwrt-natmapt.git package/natmapt
git clone --depth 1 --branch master --single-branch https://github.com/muink/openwrt-stuntman.git package/stuntman
# easytier
git clone --depth 1 -b main https://github.com/EasyTier/luci-app-easytier.git package/package-easytier
#tailscale
#git clone https://github.com/asvow/luci-app-tailscale.git package/luci-app-tailscale
git clone https://github.com/GuNanOvO/openwrt-tailscale.git package/tailscale
git clone https://github.com/Tokisaki-Galaxy/luci-app-tailscale-community.git package/luci-app-tailscale-community

#fakehttp
git clone https://github.com/yingziwu/openwrt-fakehttp.git package/fakehttp
git clone https://github.com/yingziwu/luci-app-fakehttp.git package/luci-app-fakehttp
#fakesip
git clone https://github.com/blueberry-pie-11/openwrt-fakesip package/fakesip
git clone https://github.com/blueberry-pie-11/luci-app-fakesip package/luci-app-fakesip
#mihomo
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/openwrt-nikki
#homeproxy
git clone https://github.com/VIKINGYFY/homeproxy.git package/luci-app-homeproxy
#git clone https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy
# 添加 rtp2httpd feed 源
# 使用 main 最新代码：
echo "src-git rtp2httpd https://github.com/stackia/rtp2httpd.git" >> feeds.conf.default
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default
# 或者固定版本（推荐稳定）：
# echo "src-git rtp2httpd https://github.com/stackia/rtp2httpd.git;v3.1.1" >> feeds.conf.default

# 更新并安装 rtp2httpd feed
#./scripts/feeds update rtp2httpd
#./scripts/feeds install -a -p rtp2httpd

# 添加 luci-app-rtp2httpd 与主程序 rtp2httpd
#echo "CONFIG_PACKAGE_rtp2httpd=y" >> .config
#echo "CONFIG_PACKAGE_luci-app-rtp2httpd=y" >> .config