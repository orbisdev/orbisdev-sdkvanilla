#/bin/bash
set -e

wget https://github.com/orbisdev/orbis-libs-gen/releases/latest/download/lib_s.tar.gz

rm -rf lib_s
tar -zxvf lib_s.tar.gz
cd lib_s

for i in *.S
do
    clang --target=x86_64-scei-ps4 -shared -nostdlib -o  ${i%.S}_stub.so $i
done

mkdir -p $ORBISDEV/usr/lib
cp *.so $ORBISDEV/usr/lib
