

I had the same problem. I owned the Trash folder, so that was not the problem. This worked for me:

Edit /etc/fstab or use gnome-disks so that the mount is not auto. Mount with both of the following:

    File system must be ntfs-3g
    Option uid=1000 must be used.

My fstab has it like this: LABEL=HOME /mnt/HOME ntfs-3g nosuid,nodev,nofail,x-gvfs-show,uid=1000 0 0

Note:

    Mounting as "ntfs" did not work
    Mounting as ntfs-3g without uid=1000 did not work.

Must do both.


Source:
https://askubuntu.com/questions/718000/cannot-move-file-to-trash-after-auto-mount-in-ubuntu-15-10
