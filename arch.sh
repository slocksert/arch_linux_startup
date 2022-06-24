#Update repositories
sudo pacman -Sy

#Install yay (install git if you dont have)
cd /home/$USERNAME
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si
cd ..

#features
sudo pacman -S --noconfirm \
curl \
wget \
opera \
opera-ffmpeg-codecs \
xorg \
noto-fonts \
noto-fonts-emoji \
ntp \
gnome-menus \
chrome-gnome-shell \
thunar \
python3 \
python-pip \
poetry \
pyenv \
code \
qbittorrent \
gnome-tweaks \
gnome-shell \
gdm \
gnome-calculator \
gnome-control-center 

yay -S --noconfirm \
ocs-url \
gnome-console \
ocs-url \
spotify

#config ntp
sudo rm /etc/ntp.conf
sudo mv ntp.conf /etc/ntp.conf
sudo ntpd -qg
sudo hwclock --systohc
sudo timedatectl set-ntp 1
sudo timedatectl set-local-rtc 1
sudo ln -sf /usr/share/zoneinfo/America/Maceio /etc/localtime

#starting services
sudo systemctl enable NetworkManager gdm ntpd

#oh my bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sudo rm .bashrc
sudo mv .bashrc /home/$USERNAME/.bashrc