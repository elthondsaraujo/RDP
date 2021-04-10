#! /bin/bash

printf "Instalando a Máquina virtual. Esta ação leva 3 minutos. Tenha paciência... " >&2
{
sudo useradd -m elton
sudo adduser elton sudo
echo 'elton:0000' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo apt-get uninstall terminal
sudo apt-get install terminator
sudo apt-get install unzip
sudo wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz
tar -xvf xdm-setup-7.2.11.tar.xz
sudo ./install.sh
#sudo apt-get update
cd home/elton
mkdir rcloneconfig
cd rcloneconfig
>rclone.conf
curl https://rclone.org/install.sh | sudo bash
sudo adduser elton chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copie o Commando do Debian Linux e cole abaixo \n'
read -p "Cole aqui o Codigo Debian: " CRP
su - elton -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
# Pós Instalação - Silent Mod
sudo apt-get install vlc -s 
sudo apt-get install ffmpeg -s
wget https://cutt.ly/dcTz2ks -s
printf 'Clique aqui para entrar na VPS https://remotedesktop.google.com/access/ \n\n'
printf 'Create (Criar) rclone.conf - after access: https://remotedesktop.google.com/access/ \n\n'
rclone rcd --rc-web-gui --rc-user=user --rc-pass=user --rc-serve --config /home/elton/rcloneconfig/rclone.conf
fi
