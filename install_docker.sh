#!/bin/bash

# Installation des dépendances et de docker
apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
apt update
apt -y install docker-ce docker-compose
systemctl enable docker
systemctl start docker

#Lancement du docker-compose.yml
docker-compose up -d
echo "Done!"
