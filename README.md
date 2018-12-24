# Docker-hadoop
This is a fork of https://github.com/flokkr/docker-hadoop but with some additional scripts.

#Changes:

* `install-docker.sh` script to automate `docker` and `docker-compose` installation
* `restart-policy` configured to `always`, to autostart cluster after machine reboots
* all data mappaed in `vloumes` folder

#Get started

1) Install `docker` and `docker-compose` (if not installed, you'll need sudo rights): `bash install-docker.sh`
2) Run hadoop cluster: `docker-compose up -d`

##Exposet ports:

### Namenode:
*localhost:9870
*localhost:50070

### Resourcemanager:
*localhost:8088

#Shut-down
To kill containers execute: `docker rm -f $(docker ps -a | grep dockerhadoop | awk '{print $1};')`

See [README-hadoop.md] for original docs.