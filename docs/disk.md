# Disk Repair

- `fsck -y /dev/sda3`

## Check health

[S.M.A.R.T](https://wiki.archlinux.org/title/S.M.A.R.T.)

- Check if the disk supports SMART detection
  - `sudo smartctl -i /dev/sda3`
- Enable SMART detection
  - `sudo smartctl -s on /dev/sda3`
- Check health
  - `sudo smartctl -H /dev/sda3`
