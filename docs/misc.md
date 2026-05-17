# Misc

## Virtual Machine

### Virtualbox

- sudo pacman -S virtualbox
  - sudo modprobe vboxdrv

### QEMU

- sudo pacman -S qemu virt-manager dnsmasq
  - sudo systemctl start libvirtd virtlogd
  - sudo systemctl enable libvirtd.service
  - sudo usermod -aG libvirt $USER

## Grub

### Theme

- sudo mount /dev/sdb2 /boot/efi
- sudo mv Vimix /boot/grub/themes

```diff
--- /etc/default/grub
+++ /etc/default/grub
-#GRUB_THEME="/path/to/gfxtheme"
+GRUB_THEME="/boot/grub/themes/Vimix/theme.txt"
```

- sudo grub-mkconfig -o /boot/grub/grub.cfg

### Verbose boot

```diff
--- /etc/default/grub
+++ /etc/default/grub
-#GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
+GRUB_CMDLINE_LINUX_DEFAULT=""
```

- sudo grub-mkconfig -o /boot/grub/grub.cfg

## printer

- sudo pacman -S cups
  - systemctl start cups

## fcitx theme

- git clone https://github.com/ayamir/fcitx5-gruvbox.git
- mv Gruvbox-Dark ~/.local/share/fcitx5/themes
