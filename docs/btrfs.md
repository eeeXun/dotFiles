# Btrfs

## Create snapshot

- sudo mount -o subvolid=5 /dev/disk1_partition2 /mnt/
- sudo btrfs subvolume snapshot -r /mnt/@ /mnt/@snapshot-$(date +%F-%H%M)
  - `-r`: read only

## Rollback

- sudo mount -o subvolid=5 /dev/disk1_partition2 /mnt/
- sudo mv @ @backup
- sudo btrfs subvolume snapshot /mnt/@snapshot-xxx /mnt/@
  - Create a writable snapshot from our read only snapshot
- reboot

## Delete snapshot

- sudo mount -o subvolid=5 /dev/disk1_partition2 /mnt/
- sudo btrfs subvolume delete /mnt/@snapshot-xxx

## List subvolume

- sudo btrfs subvolume list -a /
