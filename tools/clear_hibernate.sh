#!/bin/bash
sudo umount /dev/sda1
sudo ntfsfix /dev/sda1
sudo ntfs-3g -o remove_hiberfile /dev/sda1 /home/ljl/other_disks/d

