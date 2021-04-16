$HOME/.local/bin/wal --backend colorz -n -i /mnt/88BC2582BC256C3E/Wallpapers/Wallpapers
/usr/bin/xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVGA1/workspace0/last-image -s "$(< "${HOME}/.cache/wal/wal")"
