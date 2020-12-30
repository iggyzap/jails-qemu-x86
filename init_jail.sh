#!/bin/bash

debootstrap --arch=amd64 stretch --include=apt,apt-utils "$1"

mount -t proc  proc   "$1/proc"
mount -t sysfs sys    "$1/sys"
mount -o bind  /dev    "$1/dev"
mount -o bind  /dev/pts "$1/dev/pts"
cp /usr/bin/qemu-x86_64-static "$1/usr/bin"

file "$1/bin/bash"

chroot "$1" /bin/true
