#!/bin/bash

qemu-system-x86_64 \
        -kernel ./kernels/bzImage \
	-cpu "qemu64,+smep,+smap" \
        -append "console=ttyS0 root=/dev/sda debug nokaslr" \
        -drive file=fs_img/rootfs_overlay.qcow2,format=qcow2 \
        -net user,hostfwd=tcp::2222-:22 \
        -net nic \
        -m 2G \
        -smp 2 \
        -nographic \
	-s -S
