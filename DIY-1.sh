# DIY-1 此脚本功能：添加外部插件
# =======================================================================================================================

# 1-添加 ShadowSocksR Plus+ 插件
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 2-添加 PowerOff 关机插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 3-添加 opentomcat 主题
git clone https://github.com/WukongMaster/luci-theme-opentomcat.git package/luci-theme-opentomcat

# 4-添加 OpenClash 插件
# sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 5-添加 PassWall 插件
# echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
# echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

# 6-添加外部软件源
echo "src-git small https://github.com/zouchanggan/openwrt-packages.git;small" >> "feeds.conf.default"
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# 7-删除依赖(防止插件冲突，删除重复)
rm -rf feeds/packages/net/{lucky,alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang

# 删除软件包(防止插件冲突，删除重复)
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-ssr-plus
rm -rf feeds/luci/applications/luci-app-vssr
rm -rf feeds/luci/applications/luci-app-ddns-go
rm -rf feeds/luci/applications/luci-app-appfilter
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-lucky
rm -rf feeds/luci/applications/luci-app-smartdns
./scripts/feeds update -a && ./scripts/feeds install -a
