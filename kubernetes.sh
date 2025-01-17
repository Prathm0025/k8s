#!/bin/bash

# Update system packages
sudo apt-get update

# Install Docker
sudo apt install -y docker.io

# Allow non-root access to Docker
sudo chmod 666 /var/run/docker.sock

# Install necessary packages for Kubernetes
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# Create a directory for Kubernetes keyring
sudo mkdir -p -m 755 /etc/apt/keyrings

# Add the Kubernetes signing key
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | \
    sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add the Kubernetes repository
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update package lists with the Kubernetes repository
sudo apt update

# Install kubeadm, kubelet, and kubectl
sudo apt install -y kubeadm kubelet kubectl

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Enable and start kubelet service
sudo systemctl enable kubelet
sudo systemctl start kubelet

# Print completion message
echo "Kubernetes setup completed successfully!"
