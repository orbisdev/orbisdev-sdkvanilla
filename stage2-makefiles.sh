#/bin/bash
set -e

cd makefiles/usr/lib
# Compile CRT0.c
clang --target=x86_64-scei-ps4 -O3 -I$ORBISDEV/usr/include -I$ORBISDEV/usr/include/c++/v1 -c -o crt0.o  crt0.c
cd ../..
cp -r * $ORBISDEV
