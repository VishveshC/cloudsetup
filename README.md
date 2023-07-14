# CloudSetup.sh

A generic script to install qBittorrent onto a NodeJSCluster Cloudcluster VM using hacky wayarounds.

**Essentially, a free movie/TV show download mirror with *10 gigabit* download speeds!**

## **Installation:**
One click run command (in the `/cloudclusters` directory):

```curl -o run.sh https://raw.githubusercontent.com/VishveshC/cloudsetup/master/run.sh && chmod +x run.sh && ./run.sh```

## **Features**:
* Uses qBittorrent under the hood which is a modified BitTorrent client.
* Uses iQbit WebUI for qBittorrent by default, which is mobile friendly, and also has a quite good desktop UI.
* Uses a basic node `http-server` to expose "download" folder to serve direct download tar files without authentication.
* Uses `nginx` to manage ReverseProxys (`qbittorrent-nox`(6969) + download `http-server`(6970)). nginx is needed as many VM providers restrict port access to 8080/80/443; in this case port 8080 is used to serve both webservers.
* Retrives URL's by modifying the env `$HOSTNAME`
* Uses custom qbittorrent and nginx configs.
* Uses `screen` to dirty-daemonise `http-server`; uses `qbittorrent-nox -d` to daemonise qbittorrent.
* Sends main website link and direct download links on telegram (configurable)

## **Speeds**:
I personally have not tested maximum upload/download speeds; however if my obersvations are something to refer, maximum down speeds are in the range of 100Mbps (Megabytes/sec) and up speeds are in the range of 10~20Mbps (Megabytes/sec).

Note that these speeds are in Megabytes/s, not megabits/s. 

That translates to around a **10 gigabit** download connection! These speeds are however subject to peer availability ofcourse.

### What is all this?
> CloudClusters is a VM provider that offers 7-day trial period on their docker images (of which Oracle VM is popular but dosent come with an open port, hence NodeJS Clusters is used here) indefinitely, as far as I know.
> Qbittorrent is a Bittorrent client for downloading torrents, and iQbit makes for a polished UI for both desktop and mobile clients; also features a good search option for `yts.mx`,`1377x.to`,`rarbg` and other popular torrenting sites. (Consult national cyber policies before using)
> This script essentially makes use of free resources to make a near-Netflix like torrenting site from which you can stream/download your favorite movies/TV shows and even download normal torrents including games without the need of a VPN (like a torrent mirror), with blazing fast download speeds.

### Screenshots:
![image](https://github.com/VishveshC/cloudsetup/assets/78300243/eb1322ca-2adc-4677-b8db-01c8557bff46)
![image](https://github.com/VishveshC/cloudsetup/assets/78300243/3f548c52-1cd2-44dc-9ca1-1116216f7ee0)
![image](https://github.com/VishveshC/cloudsetup/assets/78300243/1bc5450d-9da6-4f8e-85eb-6bd14a930a8b)


⚠️ This script can only work on Cloudcluster's NodeJS Cluster machine, as I have implemented dirty ways for workarounds.
Please raise an issue if a better way to implement something is found.

> *(Might develop a 'proper' script if the repo gets any attention 💀)*

> I am not responsible for any legal action against the use of this script neither for potential account ban; it is a mere personal project/proof of concept.
