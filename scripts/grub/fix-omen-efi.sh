#!/bin/zsh

sudo efibootmgr -c -d /dev/nvme1n1 -p 1 -L "ubuntu" -l "\EFI\ubuntu\grubx64.efi"
