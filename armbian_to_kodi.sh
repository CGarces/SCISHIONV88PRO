#save standard repos
mv sources.list sources.list.d/debian.list
mv /etc/apt/sources.list.d/armbian.list /etc/apt/sources.list.d/armbian.list.bak

#Get new repos
wget http://oph.mdrjr.net/meveric/sources.lists/meveric-jessie-main.list  -O /etc/apt/sources.list.d/meveric-jessie.list
wget http://oph.mdrjr.net/meveric/sources.lists/meveric-jessie-backports.list -O ->>/etc/apt/sources.list.d/meveric-jessie.list

wget -O - http://oph.mdrjr.net/meveric/meveric.asc | apt-key add -

#Config system
apt-get clean
apt-get update
apt-get upgrade

dpkg-reconfigure keyboard-configuration
dpkg-reconfigure locales
dpkg-reconfigure tzdata

#xserver dependencies
apt-get install xcompmgr xterm xinit xauth xserver-xorg dbus-x11 xfonts-base x11-xserver-utils x11-common x11-utils --no-install-recommends
#libegl1-mesa-drivers libgl1-mesa-dri

#Kodi
apt-get install kodi-odroid libcurl3-gnutls libnfs4

#Aditional dependencies
apt-get install aml-libs-odroid mali450-odroid xf86-video-mali-odroid libump-odroid --no-install-recommends

#xorg config
wget https://raw.githubusercontent.com/Fourdee/DietPi/master/dietpi/conf/xorg_c2.conf -O /etc/X11/xorg.conf

#Edit .profile to run codi on startup
#echo [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && xinit kodi-standalone >> /home/some_user/.profile
#Edit etty@tty1.service to auto logon
#sudo nano /etc/systemd/system/getty.target.wants/getty@tty1.service
