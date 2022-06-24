#Install yay (install git if you dont have)
cd /home/$USERNAME
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si


#features
sudo pacman -S --noconfirm \

opera \
opera-ffmpeg-codecs \
xorg \
noto-fonts \
noto-fonts-emoji \
ntp \
gnome-menus \
chrome-gnome-shell \
thunar \
curl \
wget \
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
sudo rm -rf /etc/ntp.conf
cd /home/$USERNAME/arch_linux_startup
sudo cp /home/$USERNAME/arch_linux_startup/ntp.conf /etc/ntp.conf
sudo ntpd -u ntp:ntp
sudo hwclock --systohc
sudo timedatectl set-ntp 1
sudo timedatectl set-local-rtc 1
sudo ln -sf /usr/share/zoneinfo/America/Maceio /etc/localtime

#starting services
sudo systemctl enable NetworkManager gdm ntpd

#oh my bash
cd /home/$USERNAME/
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sudo rm .bashrc
sudo cp /home/$USERNAME/arch_linux_startup/.bashrc /home/$USERNAME/.bashrc

#remove yay folder
rm -rf /home/$USERNAME/yay

#Update repositories
sudo pacman -Sy

#reboot
reboot