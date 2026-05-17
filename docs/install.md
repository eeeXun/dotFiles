# Install

## flush ISO

> https://wiki.archlinux.org/title/USB_flash_installation_medium

- sudo dd if=(isoImg) of=/dev/sdc bs=4M status=progress

## Check boot mode (BIOS or UEFI)

[Arch Wiki](https://wiki.archlinux.org/title/Installation_guide#Verify_the_boot_mode)

- ls /sys/firmware/efi/efivars

## partitions

- `cfdisk`
- If it's BIOS
  - 1M BIOS boot (512M EFI System)
- 4G Linux swap
- Linux root
- Linux home
- `lsblk` check

### format

- UEFI
  - mkfs.fat -F 32 /dev/sdb1
- mkfs.ext4 /dev/sda2
- mkswap /dev/sda3
  - swapon -a

## wifi

```shell
$ iwctl
> device list
> station wlan0 scan
> station wlan0 get-networks
> station wlan0 connect [name]
```

## mount

- mount /dev/sda2 /mnt
- pacman -Syy
- pacman -S archlinux-keyring
- pacstrap /mnt base linux linux-firmware base-devel neovim grub (dhcpcd | networkmanager) git
- UEFI
  - pacstrap /mnt efibootmgr os-prober
- HOME
  - mount /dev/sda1 /mnt/home
- genfstab -U /mnt >> /mnt/etc/fstab
  - blkid (Get disk UUID)

The result will looks like

```fstab
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>

# /dev/sdb3
UUID=6f7777f6-ba84-4610-8d5d-64d1e07d5d8b	/         	ext4      	rw,relatime	0 1

# /dev/sda1
UUID=c74f1a59-c570-4c4f-b1b1-7c47149e4c3e	/home     	ext4      	rw,relatime	0 2
```

## mirrorlist

```sh
reflector --country Taiwan --sort rate --save /mnt/etc/pacman.d/mirrorlist
```

## arch-chroot

- arch-chroot /mnt
- passwd

### grub install

#### BIOS

```sh
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

#### UEFI

```sh
mkdir /efi
mount /dev/sdb2 /efi
```

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

### timezone

```sh
ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
timedatectl set-ntp true
```

### network

- systemctl enable (dhcpcd | NetworkManager)

### host

```diff
+++ /etc/hostname
+xun-arch
```

```diff
+++ /etc/hosts
+127.0.0.1   localhost
+127.0.0.1   xun-arch
+::1         localhost
```

### locale

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

### pacamn

```diff
--- /etc/pacman.conf
+++ /etc/pacman.conf
 # Misc options
 #UseSyslog
-#Color
+Color
```

## Wheel

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

[See GPU settings](gpu.md)

[See disk repair](disk.md)
