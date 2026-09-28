#!/usr/bin/env bash
cd ~

#Install core packages as root
echo 'Installing essential packages...'
su root
apt update && apt upgrade -y
apt install sudo gnome-core gnome-shell-extension-manager gnome-software-plugin-flatpak firefox-esr flatpak micro kitty gdm3 git make node-typescript

#Add user to Sudo group
echo 'Adding user to Sudo group...'
read -r -p "What is the username?" userName
export userName
sudo adduser $userName sudo
su $userName

#Compile Pop Shell
echo 'Compiling Pop-Shell...'
git clone https://github.com/pop-os/shell.git
cd shell
make local-install

#Setting up Flathub Repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Installing GDM Settings
echo 'Installing GDM Settings...'
flatpak install GDM Settings

#Rebooting system
echo 'Rebooting...'
sudo reboot
