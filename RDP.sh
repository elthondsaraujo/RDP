#! /bin/bash

printf "Instalando a maquina virtual. Esta ação leva 2 minutos. Tenha paciência... " >&2
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
sudo wget https://sourceforge.net/projects/xdman/files/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
sudo ./install.sh
#sudo apt-get update
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
printf "Instalando RClone... Clique no link acima para entrar na Maquina... \n\n'
sudo apt-get install vlc --silent 
sudo apt-get install ffmpeg --silent 
wget https://cutt.ly/dcTz2ks --silent 
printf 'Clique aqui para entrar na VPS https://remotedesktop.google.com/access/ \n\n'
rclone rcd --rc-web-gui --rc-user=user --rc-pass=user --rc-serve
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
