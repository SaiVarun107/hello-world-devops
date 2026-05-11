#!/bin/bash

sudo apt update -y

# INSTALL DOCKER

sudo apt install docker.io -y

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker ubuntu

# INSTALL K3S

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

# KUBECONFIG FOR UBUNTU USER

mkdir -p /home/ubuntu/.kube

sudo cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config

sudo chown ubuntu:ubuntu /home/ubuntu/.kube/config

# ENV VARIABLE

echo 'export KUBECONFIG=/home/ubuntu/.kube/config' >> /home/ubuntu/.bashrc
