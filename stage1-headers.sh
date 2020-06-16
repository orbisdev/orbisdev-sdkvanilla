#/bin/bash
set -e

git clone --depth 1 https://github.com/orbisdev/orbisdev-headers.git

cd orbisdev-headers/include

mkdir -p $ORBISDEV/usr/include
cp -r * $ORBISDEV/usr/include
