# Installing wifi drivers on Macbook Pro 2012 [MacBookPro9,2 1.0]

## ArchLinux

This answer was posted by [greektex](https://unix.stackexchange.com/users/449362/greektex) on [unix.stackexchange](https://unix.stackexchange.com/questions/627451/unresponsive-ssh-session-in-manjaro-arch-linux-after-using-scp-rsync).
I have saved it here without any modifications.
-------------
I found the solution. The reason for the SSH problems was the driver for my wifi chipset. I am using Broadcom BCM4311 and installing the broadcom-wl driver solved the problem for me. I first installed the linux header packages for all installed kernels and then the broadcom-wl-dkms driver.
```
sudo pacman -Syyu
sudo pacman -S $(pacman -Qsq "^linux" | grep "^linux[0-9]*[-rt]*$" | awk '{print $1"-headers"}' ORS=' ')
sudo pacman -S broadcom-wl-dkms
```
After a reboot, the "wl" driver should be enabled, which I can confirm with this command:
```
laptop% inxi -Fxz | grep BCM4331
           Device-2: Broadcom BCM4331 802.11a/b/g/n vendor: Apple AirPort Extreme driver: wl v: kernel port: efa0 
```
The driver should be wl, not bcma-pci-bridge.

The following websites pointed me to the solution:

https://wiki.archlinux.org/index.php/Broadcom_wireless#SSH_freeze_for_BCM4331_with_b43

https://archived.forum.manjaro.org/t/broadcom-wifi-driver-fails-to-install-properly


## Fedora
https://ask.fedoraproject.org/t/macbook-pro-user-struggles-to-connect-to-wifi-on-fedora-35/17840/4

## OpenSUSE

With old chipsets like BCM430,BCM4306, BCM4309, BCM4311, BCM4312, BCM4318, BCM4322, BCM4331, BCM43224 y BCM43225 We will only introduce the following commands (connected to the Internet via cable).
```
sudo zypper install b43-fwcutter
sudo /usr/sbin/install_bcm43xx_firmware
```
We reboot and ready


https://blog.desdelinux.net/en/instalar-controladores-broadcom-en-opensuse/

## Ubuntu 

### NOTE: This works with Macbook pro 2012 on Ubuntu 24.10

Broadcom [b43](https://wiki.archlinux.org/title/Broadcom_wireless#b43) drivers are reverse engineered version of broadcom drivers and are buggy. In ubuntu i have noticed that with these drivers there is signification packet loss and in arch linux these drivers cause [SSH sessions to freeze](https://wiki.archlinux.org/title/Broadcom_wireless#SSH_freeze_for_BCM4331_with_b43). What we need is [broadcom-wl](https://wiki.archlinux.org/title/Broadcom_wireless#broadcom-wl) drivers. You can install these on Ubuntu as following:

```
sudo apt-get update
sudo apt-get install dkms linux-headers-$(uname -r) broadcom-sta-dkms

# insert driver into kernel and update initial ramdisk
sudo modprobe -rf wl
sudo modprobe -vv wl
sudo update-initramfs -c -k all
```

