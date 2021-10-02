#/bin/bash
set -e

cd makefiles

cp -r * $ORBISDEV

# Compile CRT0.c
cd .. 
clang --target=x86_64-scei-ps4 -O3 -I$ORBISDEV/usr/include -I$ORBISDEV/usr/include/c++/v1 -c -o crt0.o  crt0.c
cp crt0.o $ORBISDEV/crt0.o