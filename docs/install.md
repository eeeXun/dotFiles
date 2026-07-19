# Install

## flush ISO

> https://wiki.archlinux.org/title/USB_flash_installation_medium

- sudo dd if=(isoImg) of=/dev/usb_disk bs=4M status=progress

## Check boot mode (BIOS or UEFI)

[Arch Wiki](https://wiki.archlinux.org/title/Installation_guide#Verify_the_boot_mode)

- ls /sys/firmware/efi/efivars

## partitions

- `cfdisk`
- BIOS / UEFI
  - 1M BIOS boot
  - 512M EFI System
- disk 1
  - Linux root
  - Linux swap
- disk 2
  - Linux home
- `lsblk` check

### format

- UEFI
  - mkfs.fat -F 32 /dev/disk1_partition1
- root / home
  - mkfs.ext4 /dev/disk1_partition2
  - mkfs.btrfs /dev/disk1_partition2
- mkswap /dev/disk1_partition3
  - swapon -a

## wifi

```
$ iwctl
> device list
> station wlan0 scan
> station wlan0 get-networks
> station wlan0 connect [name]
```

## mount

### ext4

- mount /dev/disk1_partition2 /mnt
- mkdir -p /mnt/home
- mount /dev/disk2_partition1 /mnt/home

### Btrfs

- disk1
  - mount /dev/disk1_partition2 /mnt
  - btrfs subvolume create /mnt/@
  - btrfs subvolume create /mnt/@pkg
  - umount /mnt
- disk2
  - mount /dev/disk2_partition1 /mnt
  - btrfs subvolume create /mnt/@home
  - umount /mnt
- mkdir -p /mnt/{home,var/cache/pacman/pkg}
- mount -o subvol=@ /dev/disk1_partition2 /mnt
- mount -o subvol=@pkg /dev/disk1_partition2 /mnt/var/cache/pacman/pkg
- mount -o subvol=@home /dev/disk2_partition1 /mnt/home

## pacstrap

- pacman -Syy
- pacman -S archlinux-keyring
- pacstrap /mnt base linux linux-firmware base-devel neovim grub git (btrfs-progs) (dhcpcd | networkmanager) (efibootmgr) (os-prober)
- genfstab -U /mnt >> /mnt/etc/fstab
  - blkid (Get disk UUID)

## mirrorlist

```sh
reflector --country Taiwan --sort rate --save /mnt/etc/pacman.d/mirrorlist
```

## arch-chroot

- arch-chroot /mnt
- passwd

## grub install

### BIOS

```sh
grub-install /dev/disk1
grub-mkconfig -o /boot/grub/grub.cfg
```

### UEFI

```sh
mkdir /efi
mount /dev/disk1_partition1 /efi
```

- Verbose boot

```diff
--- /etc/default/grub
+++ /etc/default/grub
-#GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
+GRUB_CMDLINE_LINUX_DEFAULT=""
```

- OS prober

```diff
--- /etc/default/grub
+++ /etc/default/grub
 # Probing for other operating systems is disabled for security reasons. Read
 # documentation on GRUB_DISABLE_OS_PROBER, if still want to enable this
 # functionality install os-prober and uncomment to detect and include other
 # operating systems.
-#GRUB_DISABLE_OS_PROBER=false
+GRUB_DISABLE_OS_PROBER=false
```

```sh
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

If [grub is not detected by BIOS](https://www.reddit.com/r/archlinux/comments/s8twyd/grub_not_showing_up_on_bios_boot_options/). Add `--removable` in `grub-install`

```sh
grub-install --target=x86_64-efi --efi-directory=/efi/ --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg
```

## timezone

```sh
ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
timedatectl set-ntp true
```

## network

- systemctl enable (dhcpcd | NetworkManager)

## host

```diff
+++ /etc/hostname
+xun-arch
```

```diff
+++ /etc/hosts
 127.0.0.1   localhost
 ::1         localhost
+127.0.0.1   xun-arch
```

## locale

```diff
+++ /etc/locale.conf
+LANG=en_US.UTF-8
```

```diff
--- /etc/locale.gen
+++ /etc/locale.gen
-#en_US.UTF-8 UTF-8
+en_US.UTF-8 UTF-8
```

- locale-gen

## pacamn

```diff
--- /etc/pacman.conf
+++ /etc/pacman.conf
 # Misc options
 #UseSyslog
-#Color
+Color
```

## wheel user

- useradd -m xun -G wheel
- passwd xun

```diff
visudo
--- /etc/sudoers
+++ /etc/sudoers
 ## Uncomment to allow members of group wheel to execute any command
-# %wheel ALL=(ALL:ALL) ALL
+%wheel ALL=(ALL:ALL) ALL
```

## Other

### Disable PowerKey

```diff
--- /etc/systemd/logind.conf
+++ /etc/systemd/logind.conf
-#HandlePowerKey=poweroff
+HandlePowerKey=ignore
```

```sh
systemctl restart systemd-logind
```

### Disable lock account

```diff
--- /etc/security/faillock.conf
+++ /etc/security/faillock.conf
-# deny = 3
+deny = 0
```

[See misc](misc.md)

[Btrfs](btrfs.md)

[See GPU settings](gpu.md)

[See disk repair](disk.md)
