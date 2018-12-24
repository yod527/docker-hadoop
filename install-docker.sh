#!/usr/bin/env bash

function installUbuntu() {
sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/$(lsb_release -is | sed -e 's/\(.*\)/\L\1/')/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | sed -e 's/\(.*\)/\L\1/') $(lsb_release -cs) stable"
sudo apt-get update

sudo apt-get install -y docker-ce
sudo apt-get install -y docker-compose
sudo apt-get install -y jq
sudo groupadd docker
sudo usermod -a -G docker $USER

}
function installCentOS() {
sudo yum update -y

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo yum install -y docker-compose
sudo groupadd docker
sudo usermod -a -G docker $USER

sudo systemctl start docker

}

if [ -n "$(which docker-compose)" ]; then
  echo "Found docker-compose, skipping install.."
else
  if [ -n "$(which yum)" ]; then
    installCentOS
  else
    installUbuntu
  fi
  echo "---------------------------------"
  echo "Logout and login again to apply your user into the 'docker' group."
  echo "---------------------------------"
fi
