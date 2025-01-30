# Permenantly mount drive(ssd, hdd) to ubuntu machine

## Steps

### 1. Check for drive to mount
`sudo fdisk -l`

### 2. Check for uuid for disk

1. `sudo blkid`
2. if doesn't work
    - `sudo fdisk /deb/<disk>`
    - You can check for <disk> in `fdisk -l` 
        - `sda`, `sdb`, ...
    - g, n, w type
    - sudo mkfs.ext4 /dev/sdd1

### 3. Check if it's mount
`df -h`

### 4. Settings for permanent mount
1. `sudo nano /etc/fstab`
2. Add the followings
    - `<disk name or uuid>  <mount point>  <file system>  <mount option>  <dump option>  <check fsck or not>`
    - e.g. `UUID=<uuid> /mnt/hdd1 ext4 defaults 0 0`

### 5. Check for errors
`sudo mount -a`


### 6. Reboot
`sudo reboot`

