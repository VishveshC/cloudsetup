apt update
apt upgrade -y
apt install -y qbittorrent-nox
pm2 stop 0
pm2 delete 0
curl -o /root/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/qBittorrent.conf
pm2 start "qbittorrent-nox"
pm2 save --force
