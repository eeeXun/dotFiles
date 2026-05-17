# GPU setting (NVIDIA)

## Check

- `lspci | grep NVIDIA`

## Disable

> https://wiki.archlinux.org/title/Hybrid_graphics#Using_udev_rules

```sh
cat > /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
```

```sh
cat > /etc/udev/rules.d/00-remove-nvidia.rules
# Remove NVIDIA USB xHCI Host Controller devices, if present
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"

# Remove NVIDIA USB Type-C UCSI devices, if present
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"

# Remove NVIDIA Audio devices, if present
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"

# Remove NVIDIA VGA/3D controller devices
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
```

## Enable

> https://wiki.archlinux.org/title/NVIDIA#Installation

Remove `kms` from `HOOKS` in `/etc/mkinitcpio.conf`

```diff
--- /etc/mkinitcpio.conf
+++ /etc/mkinitcpio.conf
-HOOKS=(base udev autodetect modconf kms keyboard keymap consolefont block filesystems fsck)
+HOOKS=(base udev autodetect modconf keyboard keymap consolefont block filesystems fsck)
```

[regenerate the initramfs](https://wiki.archlinux.org/title/Regenerate_the_initramfs)

```sh
sudo mkinitcpio -P
```
