#!/bin/bash

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci

# UA3F 需要走 CPU/防火墙路径，关闭转发卸载
uci -q set firewall.@defaults[0].flow_offloading='0'
uci -q set firewall.@defaults[0].flow_offloading_hw='0'
uci commit firewall

# Disable IPV6 ula prefix
# sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
# uci set fstab.@global[0].check_fs=1
# uci commit fstab

exit 0
