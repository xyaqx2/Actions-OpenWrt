#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Clean build environment
# make distclean

# patch for libfring which causes build to fail https://github.com/openwrt/packages/issues/23621
mkdir -p feeds/packages/libs/libpfring/patches/
[ -e $GITHUB_WORKSPACE/999-issue-23621.patch ] && mv $GITHUB_WORKSPACE/999-issue-23621.patch feeds/packages/libs/libpfring/patches/
