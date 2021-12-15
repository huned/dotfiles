#!/bin/bash

read -p "Press ENTER to run $0 or CTRL-C to exit..." nop

TMPDIR=$HOME/postinstall-tmp/postinstall-cache
mkdir -p $TMPDIR

# install facetime hd drivers (camera on my macbook air)
#
# TODO only run if we detect the facetimehd camera hardware
#
# See https://github.com/patjak/bcwc_pcie/wiki/Get-Started
# Four separate steps.
#
echo "Setting up FacetimeHD kernel module"

# 0. Install dependencies
apt-get install -y checkinstall cpio kmod unrar xz-utils

# install kernel headers
apt-get -y install linux-headers-$(uname -r)

# 1. Extract camera firmware and install it into /lib/firmware/facetimehd
rm -rf $TMPDIR/facetimehd-firmware
git clone https://github.com/patjak/facetimehd-firmware.git $TMPDIR/facetimehd-firmware
pushd $TMPDIR/facetimehd-firmware
make clean && make && make install
depmod
popd

# 2. Extract sensor calibration files from bootcamp driver and install into /lib/firmware/facetimehd
wget --quiet --timestamping --directory-prefix=$TMPDIR https://download.info.apple.com/Mac_OS_X/031-30890-20150812-ea191174-4130-11e5-a125-930911ba098f/bootcamp5.1.5769.zip
rm -rf $TMPDIR/BootCamp
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
rm -rf $TMPDIR/bcwc_pcie
git clone https://github.com/patjak/bcwc_pcie.git $TMPDIR/bcwc_pcie
pushd $TMPDIR/bcwc_pcie
make && checkinstall -y --nodoc
depmod
modprobe -r facetimehd
modprobe facetimehd
popd

echo "Done"
echo
