#!/bin/bash

# WARNING -> THIS SCRIPT IS WORK IN PROGRESS AND IT MIGHT NOT WORK PROPERLY
# =======================================
# Mastroalberto - file generated 10/24/2025 
# contact: alberto.bella@protonmail.com
# =======================================


# Interrupts when a command fails (e.g no internet connection)
set -e 

trap 'echo "ERROR: command failed at line $LINENO"; exit 1' ERR 

# Checking root privilegies...
if [[ $EUID -ne 0 ]]; then
   echo "This script must be excecuted by root!" >&2
   exit 1
fi 

# function to prevent script continue after command fail 
check_command() {
	if ! "$@"; then 
		echo "ERROR: Command failed!"
		exit 1
	fi 
}

echo "Starting Fedora codecs installation script..."

echo "Verifying internet connection..."
if ! ping -c 2 mirrors.rpmfusion.org &>/dev/null; then 
	echo "Error fetching rmpfusion mirrors, check your internet connection or try later!"
	exit 1
fi 

# Installing RPM Fusion free and nonfree repos
echo "Installing RPM fusion free and nonfree repos..."
check_command dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm --assumeyes

# Installing the main codecs
echo "Installing main codecs..."
check_command dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel --assumeyes

# Replacing ffmpeg-free with regular ffmpeg
echo "Replacing ffmpeg-free with regular ffmpeg..."
dnf install ffmpeg --allowerasing --assumeyes

echo "Fedora Codecs Installation Script has completed the operations."
