#/bin/bash
set -e

rm -f orbisdev_sysroot.tar

wget https://github.com/orbisdev/orbis-sysroot/releases/latest/download/orbisdev_sysroot.tar

rm -rf usr
tar -xvf orbisdev_sysroot.tar
cp -r usr $ORBISDEV
