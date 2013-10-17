#!/bin/bash
set -u
set -e
mount -o subvolid=0 /dev/sda1 /snapshot/mnt
btrfs subvolume snapshot / /snapshot/mnt/snapshot/$1
umount /snapshot/mnt
btrfs subvolume list /

