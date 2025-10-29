#!/bin/bash
# Post-install script for ElementaryOS. Run it as root via sudo.
#
# TODOs
# - separate camera and wifi setup
#   - store local blob of stuff needed to set up wifi hardware
# - bail out if platform/uname doesn't meet expected value
# - make this script idempotent
# - change swap partition size to 2x RAM

# EOS_VERSION=$(cat /etc/issue.net | cut -d ' ' -f 3)
# PLATFORM=$(uname -s)

#[[ "${EOS_VERSION}" != "Odin" ]] && echo "Sorry, this script only runs on elementary OS Odin." && exit 1

TMPDIR=$(mktemp -d)

read -p "Press ENTER to run $0 or CTRL-C to exit..." nop

# uninstall all i386 packages and disable i386 architecture
#
# TODO only run if arch is amd64
apt-get -y purge `dpkg --get-selections | grep ":i386" | awk '{print $1}'`
dpkg --remove-architecture i386

# uninstall packages i don't use
#apt-get -y purge pantheon-mail maya-calendar epiphany-browser
#apt-get -y purge libreoffice

# update system
apt-get -y install software-properties-common
apt-get -y update && apt-get -y upgrade
#apt-get -y dist-upgrade

# install common development libraries and tools
apt-get -y install lib32z1 libbz2-dev libexpat1-dev libffi-dev libreadline-dev libsqlite3-dev libssl-dev unixodbc-dev zlib1g-dev
apt-get -y install bat build-essential bzip2 curl docker.io jq net-tools pv ranger ripgrep sqlite3 tmux tree unzip wget zip

# install kernel headers
apt-get -y install linux-headers-$(uname -r)

# install essential programs
apt-get -y install chromium-browser

# install broadcom wifi drivers (wifi on 2013 macbook air)
#
# TODO only run if we detect the broadcom wireless hardware
#
# See
# * https://help.ubuntu.com/community/WifiDocs/Driver/bcm43xx
# * https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers
apt-get -y --reinstall install bcmwl-kernel-source
modprobe -r b43 ssb wl brcmfmac brcmsmac bcma
modprobe wl

# git
apt -y remove git
add-apt-repository ppa:git-core/ppa
apt-get -y update && apt-get -y install git

# neovim
add-apt-repository ppa:neovim-ppa/stable 
apt-get -y update && apt-get -y install neovim

# TODO charmbracelet tools: crush, gum, glow, etc

# install facetime hd drivers (camera on my macbook air)
#
# TODO only run if we detect the facetimehd camera hardware
#
# See https://github.com/patjak/bcwc_pcie/wiki/Get-Started
# Four separate steps.
#
# 0. Install dependencies
apt-get install -y checkinstall cpio kmod unrar xz-utils

# 1. Extract camera firmware and install it into /lib/firmware/facetimehd
git clone https://github.com/patjak/facetimehd-firmware.git $TMPDIR/facetimehd-firmware
pushd $TMPDIR/facetimehd-firmware
make && make install
popd

# 2. Extract sensor calibration files from bootcamp driver and install into /lib/firmware/facetimehd
wget --quiet --timestamping --directory-prefix=$TMPDIR https://download.info.apple.com/Mac_OS_X/031-30890-20150812-ea191174-4130-11e5-a125-930911ba098f/bootcamp5.1.5769.zip
pushd $TMPDIR
unzip bootcamp5.1.5769.zip BootCamp/Drivers/Apple/AppleCamera64.exe
pushd BootCamp/Drivers/Apple
unrar x -y AppleCamera64.exe AppleCamera.sys
dd bs=1 skip=1663920 count=33060 if=AppleCamera.sys of=9112_01XX.dat
dd bs=1 skip=1644880 count=19040 if=AppleCamera.sys of=1771_01XX.dat
dd bs=1 skip=1606800 count=19040 if=AppleCamera.sys of=1871_01XX.dat
dd bs=1 skip=1625840 count=19040 if=AppleCamera.sys of=1874_01XX.dat
cp *.dat /lib/firmware/facetimehd
popd
popd

# 3. TODO Add user to the 'video' group
# usermod -a -G video $USER

# 4. Install bcwc_pcie (see https://github.com/patjak/bcwc_pcie/wiki/Installation#get-started-on-ubuntu)
git clone https://github.com/patjak/bcwc_pcie.git $TMPDIR/bcwc_pcie
pushd $TMPDIR/bcwc_pcie
make && checkinstall -y --nodoc
depmod
modprobe facetimehd
popd

# install epson scanner drivers (epson es-300w scanner)
# See http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
wget --quiet --timestamping --directory-prefix=$TMPDIR https://download2.ebz.epson.net/epsonscan2/common/deb/x64/epsonscan2-bundle-6.6.2.4.x86_64.deb.tar.gz
pushd $TMPDIR
tar xzf epson*.deb.tar.gz
dpkg -i $TMPDIR/epsonscan2-bundle-*.deb/core/epsonscan2_*.deb 

# tidy up
apt-get -y autoremove --purge

# reboot
echo "Done."
read -p "Press ENTER to reboot..." nop
shutdown -r now
