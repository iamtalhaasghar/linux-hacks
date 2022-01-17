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
