#!/usr/bin/env bash
# ==============================================================================
# AdvikOS - Ultra-Low RAM Gaming & Android OS
# Archiso Profile Definition
# ==============================================================================

iso_name="advikos"
iso_label="ADVIKOS_$(date +%Y%m)"
iso_publisher="AdvikOS Project <https://github.com/advikos>"
iso_application="AdvikOS - Low-RAM Gaming, Windows & Android OS"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '15')

# File permissions for custom scripts in airootfs
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/etc/skel/.config/labwc/autostart"]="0:0:755"
  ["/usr/local/bin/advik-menu"]="0:0:755"
  ["/usr/local/bin/advik-waydroid-init"]="0:0:755"
  ["/usr/local/bin/advik-installer"]="0:0:755"
  ["/usr/local/bin/advik-report-error"]="0:0:755"
  ["/usr/local/bin/advik-updater"]="0:0:755"
)
