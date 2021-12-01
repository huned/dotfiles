#!/bin/bash
# Post-install script for ElementaryOS. Run it as root via sudo.
#
# TODOs
# - bail out if platform/uname doesn't meet expected value
# - make this script idempotent
# - change swap partition size to 2x RAM
# - set up user account(s)
#   - install fzf from git repo `git clone git://github.com/junegunn/fzf ~/.fzf
#   && ~/.fzf/install`
# - see also inline TODOs below
# - run pulseaudio user systemd script https://askubuntu.com/questions/1146026/problem-with-pulseaudio-at-startup-it-doesnt-start

# EOS_VERSION=$(cat /etc/issue.net | cut -d ' ' -f 3)
# PLATFORM=$(uname -s)

#[[ "${EOS_VERSION}" != "Odin" ]] && echo "Sorry, this script only runs on elementary OS Odin." && exit 1

TMPDIR=$HOME/postinstall-tmp/postinstall-cache
mkdir -p $TMPDIR

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
apt-get -y install bat build-essential bzip2 curl docker.io jq pv ranger ripgrep sqlite3 tmux tree unzip wget zip

# install kernel headers
apt-get -y install linux-headers-$(uname -r)

# install essential programs
apt-get -y install chromium-browser dconf-editor firefox transmission

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

# beekeeper studio
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" > /etc/apt/sources.list.d/beekeeper-studio-app.list
apt-get -y update && apt-get -y install beekeeper-studio

# foliate
add-apt-repository ppa:apandada1/foliate
apt-get -y update && apt-get -y install foliate

# insync
# NOTE: use ubuntu/focal because ElementaryOS 6.0 is based on Ubuntu/Focal.
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
echo "deb http://apt.insync.io/ubuntu focal non-free contrib" > /etc/apt/sources.list.d/insync.list
apt-get -y update && apt-get -y install insync

# pantheon tweaks
# TODO Only run if ElementaryOS 6.0
apt-key adv --keyserver keyserver.ubuntu.com --recv c42d52715a84c7d0d02fc740c1d89326b1c71ab9
echo "deb http://ppa.launchpad.net/philip.scott/pantheon-tweaks/ubuntu focal main\ndeb-src http://ppa.launchpad.net/philip.scott/pantheon-tweaks/ubuntu focal main" > /etc/apt/sources.list.d/pantheon-tweaks.list
apt-get -y update && apt-get -y install pantheon-tweaks

# zoom
# 0. Install dependencies
apt-get -y install libgl1-mesa-glx libegl1-mesa libxcb-xtest0
# 1. Install zoom
wget --quiet --timestamping --directory-prefix=$TMPDIR https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i $TMPDIR/zoom_amd64.deb

# github:marsqing/libinput-three-finger-drag
# See [README](https://github.com/marsqing/libinput-three-finger-drag).
# The easiest/fastest way is to just download the release binary.
# NOTE: Do not run this as root. Users should be a member of the "input" group
# and run this manually or via an automatic mechanism like systemd.
#
# 0. Install dependencies
apt-get -y install libxdo3 libinput-tools

# 1. Install libinput-three-finger-drag
wget --quiet --timestamping --directory-prefix=$TMPDIR https://github.com/marsqing/libinput-three-finger-drag/releases/download/0.1/libinput-three-finger-drag.tgz
mkdir -p /usr/local/libinput-three-finger-drag
pushd /usr/local/libinput-three-finger-drag
tar xzf $TMPDIR/libinput-three-finger-drag.tgz
popd

# 2. TODO: Add user to 'input' group
# usermod -a -G input $USER

# 3. TODO: Disable gestures in ElementaryOS 6.0
# Sysem Settings > Mouse/Touchpad > Gestures > disable everything

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
