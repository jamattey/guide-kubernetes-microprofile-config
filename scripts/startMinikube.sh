#!/bin/bash

# Set up kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
ln -s -f "$(pwd)/kubectl" "/usr/local/bin/kubectl"

apt-get update -y
apt-get install -y conntrack

sysctl fs.protected_regular=0

# Start Minikube
minikube start --driver=none --bootstrapper=kubeadm
#eval "$(minikube docker-env)"
