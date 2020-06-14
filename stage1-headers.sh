#/bin/bash
set -e

git clone --depth 1 https://github.com/orbisdev/orbis-headers.git

cd orbis-headers
# Remove all files, just keeping headers
find . -type f ! -iname "*.h" -delete

mkdir $ORBISDEV/include
cp -r * $ORBISDEV/include