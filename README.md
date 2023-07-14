#CloudSetup.sh
A generic script to install qBittorrent onto a NodeJSCluster Cloudcluster VM using hacky wayarounds.

##**Installation:**
One click run command (in the /cloudclusters directory):

🔥 ```curl -o run.sh https://raw.githubusercontent.com/VishveshC/cloudsetup/master/run.sh && chmod +x run.sh && ./run.sh```🔥

##**Features**:
* Uses qBittorrent under the hood which is a modified BitTorrent client.
* Uses iQbit WebUI for qBittorrent by default, which is mobile friendly, and also has a quite good desktop UI.
* Uses a basic node http-server to expose "download" folder to serve direct download tar files without authentication.
* Uses nginx to manage ReverseProxys (qbittorrent(6969) + download http-server(6970)). nginx is needed as many VM providers restrict port access to 8080/80/443; in this case port 8080 is used to serve both webservers.
* Retrives URL's by modifying the env "$HOSTNAME"
* Uses custom qbittorrent and nginx configs.
* Uses "screen" to dirty-daemonise http-server; uses "qbittorrent-nox -d" to daemonise qbittorrent.
* Sends main website link and direct download links on telegram (configurable)

⚠️ This script can only work on Cloudcluster's NodeJS Cluster machine, as I have implemented dirty ways for workarounds.
Please raise an issue if a better way to implement something is found.

*(Might develop a 'proper' script if the repo gets any attention 💀)*

I am not responsible for any legal action against the use of this script neither for potential account ban; it is a mere personal project/proof of concept.
