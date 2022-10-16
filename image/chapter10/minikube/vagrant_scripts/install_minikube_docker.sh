#!/usr/bin/env bash

# install docker
apt-get update
apt-get -y install docker docker-compose
sudo usermod -aG docker vagrant && newgrp docker

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
mv minikube /usr/local/bin/

sudo snap install kubectl --classic
