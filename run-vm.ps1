<#
.SYNOPSIS
    AdvikOS 1 GB RAM Virtual Machine Launcher (QEMU)
.DESCRIPTION
    Launches AdvikOS inside QEMU configured with exactly 1 GB of RAM
    to test low-memory performance, Wayland compositor, and apps.
#>

$ErrorActionPreference = "Stop"
$advikDir = "C:\Users\Shreyas\AdvikOS"
$outDir = Join-Path $advikDir "out"

# Find QEMU binary
$qemuCmd = Get-Command "qemu-system-x86_64" -ErrorAction SilentlyContinue
if (-not $qemuCmd) {
    if (Test-Path "C:\Program Files\qemu\qemu-system-x86_64.exe") {
        $qemuCmd = "C:\Program Files\qemu\qemu-system-x86_64.exe"
    } else {
        Write-Error "QEMU was not found. Please ensure QEMU installation has completed."
        exit 1
    }
} else {
    $qemuCmd = $qemuCmd.Source
}

# Look for AdvikOS ISO image in out/ directory or root directory
$isoFiles = Get-ChildItem -Path $outDir, $advikDir -Filter "*.iso" -ErrorAction SilentlyContinue | Select-Object -First 1

if (-not $isoFiles) {
    Write-Host "============================================================" -ForegroundColor Yellow
    Write-Host "                AdvikOS ISO Not Yet Built                   " -ForegroundColor Yellow
    Write-Host "============================================================" -ForegroundColor Yellow
    Write-Host "No .iso file found in $outDir."
    Write-Host ""
    Write-Host "To produce the ISO file for VM testing:"
    Write-Host "  Method 1 (Free Cloud Build): Push AdvikOS to GitHub and run"
    Write-Host "           the GitHub Action in .github/workflows/build-iso.yml"
    Write-Host "  Method 2 (Local Build): Run ./build.sh inside an Arch/WSL environment"
    Write-Host ""
    exit 1
}

$isoPath = $isoFiles.FullName
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "          AdvikOS - 1 GB RAM Virtual Machine Test           " -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "VM Configuration:"
Write-Host "  • Memory (RAM)    : 1024 MB (1.0 GB strictly enforced)"
Write-Host "  • CPU Cores       : 2 Cores"
Write-Host "  • Display / GPU   : VirtIO High-Performance GPU"
Write-Host "  • Sound Device    : Intel HDA Audio"
Write-Host "  • Boot ISO        : $isoPath"
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "Launching QEMU Virtual Machine..." -ForegroundColor Green

& $qemuCmd `
    -m 1024 `
    -smp 2 `
    -vga virtio `
    -device intel-hda -device hda-duplex `
    -cdrom "$isoPath" `
    -boot d `
    -name "AdvikOS 1GB RAM Test Environment"
