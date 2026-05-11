#!/bin/bash

sudo apt update -y

# Docker Installation
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu

# K3s Installation
curl -sfL https://get.k3s.io | sh -

# Kubectl Access
mkdir -p /home/ubuntu/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
sudo chown ubuntu:ubuntu /home/ubuntu/.kube/config