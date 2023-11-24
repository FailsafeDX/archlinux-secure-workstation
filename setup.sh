#!/bin/bash

# Update System
sudo pacman -Syu

# Install Git
sudo pacman -S git

# Install YAY
mkdir ~/src
cd ~/src
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sr
sudo pacman -U yay*zst

# Gnome Extension Connector
git clone https://aur.archlinux.org/gnome-browser-connector.git
cd gnome-browser-connector
makepkg -si

# Gnome Extensions
yay -S gnome-shell-extension-appindicator gnome-shell-extension-dash-to-panel

# Install system services
pacman -s lm_sensors avahi cups firewalld
sudo systemctl enable --now lm_sensors
sudo systemctl enable --now avahi-daemon
sudo systemctl enable --now cups
sudo systemctl enable --now firewalld

# Install Applications
yay -S nano libreoffice-fresh vlc hunspell-en_CA firefox neofetch htop screen irssi brave-bin keepassxc p7zip unrar yt-dlp element-desktop discord tenacity boxes transmission-gtk gajim hexchat steam wine lib32-pipewire qtox proxychains tor evolution cjdns rsync

# Install MEGA
wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst && sudo pacman -U "$PWD/megasync-x86_64.pkg.tar.zst"
yay -S nautilus-megasync
