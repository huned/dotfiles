#!/usr/bin/env sh

wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" > /etc/apt/sources.list.d/beekeeper-studio-app.list
apt-get -y update && apt-get -y install beekeeper-studio
