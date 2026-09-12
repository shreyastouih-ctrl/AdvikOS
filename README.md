# AdvikOS 🎮

[![Download AdvikOS ISO](https://img.shields.io/badge/Download-AdvikOS%20(ISO)-brightgreen?style=for-the-badge&logo=archlinux)](https://github.com/shreyastouih-ctrl/AdvikOS/releases/latest)
[![Build Status](https://img.shields.io/github/actions/workflow/status/shreyastouih-ctrl/AdvikOS/build-iso.yml?branch=main&style=for-the-badge)](https://github.com/shreyastouih-ctrl/AdvikOS/actions)

### 📥 Direct ISO Download Link:
👉 **[Download Latest AdvikOS ISO (advikos-x86_64.iso)](https://github.com/shreyastouih-ctrl/AdvikOS/releases/latest)**  
*(Also available in the [Artifacts section](https://github.com/shreyastouih-ctrl/AdvikOS/actions) of every workflow run)*

---

**AdvikOS** is an ultra-lightweight, high-performance gaming operating system based on **Arch Linux**, tailored for computers with **1 GB RAM**.


It brings together:
- 🍷 **Windows Software & Games**: Full Wine integration with 32-bit & 64-bit multiarch.
- 💾 **Windows NTFS Reader & Writer**: Full support for reading/writing internal Windows drives and USBs (NTFS-3G, FAT32, exFAT, auto-mounting via Udisks2 & GVFS).
- 🕹️ **Retro Emulation**: RetroArch pre-configured for retro consoles (NES, SNES, GBA, Genesis, etc.).
- 🤖 **Android Container**: Waydroid integration (runs Android apps seamlessly on Wayland).
- 🖥️ **Full Lightweight Desktop Environment**:
  - **Start Menu & Search**: `Wofi` with dark gaming theme
  - **Desktop Icons**: PCManFM desktop manager with shortcuts for games and drives
  - **Text Editor**: `Mousepad` (view and edit config and game files)
  - **Archive Manager**: `Xarchiver` (supports `.zip`, `.rar`, `.7z` game archives)
  - **Image Viewer**: `Viewnior`
  - **Audio Mixer GUI**: `Pavucontrol`
  - **Display / Monitor GUI**: `Wdisplays` (adjust resolution and multi-monitors)
  - **Notifications**: `Mako` notification daemon
  - **Wi-Fi / Network GUI**: `NetworkManager Applet` in system tray
- 🌐 **Modern Web Browsing**: Falkon web browser with low-RAM footprint.
- ⚡ **Memory Engine**: Dynamic real-time RAM compression via `zram-generator` (expands 1 GB into ~2.4 GB usable virtual memory).

---

## System Architecture & Idle Memory

```
┌────────────────────────────────────────────────────────┐
│                      AdvikOS UI                        │
│   (Labwc Wayland Compositor + Waybar + Desktop Icons)  │
│                     ~35 MB RAM                         │
├────────────────────────────────────────────────────────┤
│                     Audio Subsystem                    │
│            (PipeWire + WirePlumber) ~12 MB             │
├────────────────────────────────────────────────────────┤
│                   Linux Kernel Base                    │
│                 Kernel + Drivers ~45 MB                │
├────────────────────────────────────────────────────────┤
│           TOTAL BASE IDLE RAM: ~92 MB                  │
│   Physical RAM Free for Games/Apps: ~908 MB / 1024 MB  │
│      Effective Virtual Memory with ZRAM: ~2,408 MB     │
└────────────────────────────────────────────────────────┘
```

---

## Desktop Shortcuts & Hotkeys

| Shortcut | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Space</kbd> | Open **Start Menu & App Search (Wofi)** |
| <kbd>Super</kbd> + <kbd>G</kbd> | Open **Advik Game Hub** |
| <kbd>Super</kbd> + <kbd>W</kbd> | Open **Web Browser (Falkon)** |
| <kbd>Super</kbd> + <kbd>E</kbd> | Open **This PC & Files (PCManFM)** |
| <kbd>Super</kbd> + <kbd>T</kbd> | Open **Terminal (Foot)** |
| <kbd>Print Screen</kbd> | Take **Desktop Screenshot** |
| <kbd>Right Click</kbd> | Open Full Categorized Menu |

---

## Intelligent Hardware Detection & Installer

AdvikOS comes with a built-in hardware diagnostic and installer (`advik-installer`):

1. **Hardware Scan**: Scans physical RAM, CPU architecture/cores, GPU type (Intel/AMD/NVIDIA), storage drives, and boot mode (UEFI vs BIOS).
2. **Dynamic OS Recommendation**:
   - **RAM ≤ 1.4 GB**: Recommends ⭐ **AdvikOS Ultra-Low RAM Edition** (150% ZRAM compression, aggressive swappiness 180, on-demand Waydroid).
   - **RAM 1.5 GB - 3.5 GB**: Recommends ⭐ **AdvikOS Balanced Edition** (100% ZRAM, standard gaming emulation).
   - **RAM ≥ 4 GB**: Recommends ⭐ **AdvikOS Performance Edition** (Vulkan DXVK acceleration, full graphics performance).
3. **Safety First**: Automatically detects existing Windows NTFS partitions to protect user data from accidental formatting.

---

## How to Build the Bootable ISO

### Method 1: Free Cloud Build via GitHub (Easiest, No Linux Required)
1. Push this folder to a GitHub repository (private or public).
2. Go to the **Actions** tab in GitHub.
3. Click **Build AdvikOS ISO** -> **Run workflow**.
4. GitHub will build the `.iso` on its cloud servers and give you a direct download link for `advikos-x86_64.iso`!

### Method 2: Local Build on Arch Linux / WSL
```bash
chmod +x build.sh
./build.sh
```
The finished ISO will be generated in `./out/`.

