apt update
apt upgrade -y
apt install -y qbittorrent-nox
pm2 stop 0
pm2 delete 0
pm2 start "qbittorrent-nox"
pm2 save --force
