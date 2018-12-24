# Docker-hadoop
This is a fork of https://github.com/flokkr/docker-hadoop but with some additional scripts.

# Changes:

* `install-docker.sh` script to automate `docker` and `docker-compose` installation
* `restart-policy` configured to `always`, to autostart cluster after machine reboots
* all data mapped to docker-volumes.

# Get started

1) Install `docker` and `docker-compose` (if not installed, you'll need sudo rights): `bash install-docker.sh`
2) Run hadoop cluster: `docker-compose up -d`

## Exposed ports:

### Namenode:
* localhost:9870
* localhost:50070

### Resourcemanager:
* localhost:8088

## Test the cluster:

```bash
# Login into hadoop namenode container

docker exec -ti $(docker ps -a | grep namenode | awk '{print $1}') bash

# Create test file

echo testfile > test.txt

# Upload and download file from hadoop

hadoop fs -put test.txt /mytest.txt
hadoop fs -get /mytest.txt mytest.txt

# Verify that files are equal

cat test.txt # uploaded file
cat mytest.txt # downloaded file
exit

```
# Shut-down
To kill containers execute: `docker-compose down`
This will delete all associated data volumes also.

See [README-hadoop.md]() for original docs.