#/bin/bash
set -e

git clone --depth 1 https://github.com/orbisdev/orbisdev-headers.git

cd orbisdev-headers

mkdir $ORBISDEV/include
cp -r * $ORBISDEV/include

