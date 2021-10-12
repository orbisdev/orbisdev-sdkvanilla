#/bin/bash
set -e

rm -f orbisdev_sysroot.tar

wget https://github.com/orbisdev/orbis-sysroot/releases/latest/download/orbisdev_sysroot.tar

rm -rf usr
tar -zxvf orbisdev_sysroot.tar
mv usr $ORBISDEV/usr
