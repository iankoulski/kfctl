#!/bin/sh

if [ -d /etc/apt ]; then
        [ -n "$http_proxy" ] && echo "Acquire::http::proxy \"${http_proxy}\";" > /etc/apt/apt.conf; \
        [ -n "$https_proxy" ] && echo "Acquire::https::proxy \"${https_proxy}\";" >> /etc/apt/apt.conf; \
        [ -f /etc/apt/apt.conf ] && cat /etc/apt/apt.conf
fi

# Install curl
apt-get update
apt-get install -y curl

# Install kubectl 

# Set the Kubernetes version as found in the UCP Dashboard or API
k8sversion=v1.15.5

# Get the kubectl binary.
curl -LO https://storage.googleapis.com/kubernetes-release/release/$k8sversion/bin/linux/amd64/kubectl

# Make the kubectl binary executable.
chmod +x ./kubectl

# Move the kubectl executable to /usr/local/bin.
mv ./kubectl /usr/local/bin/kubectl


# Install kfctl

curl -o kfctl_v0.6.2_linux.tar.gz -L0 https://github.com/kubeflow/kubeflow/releases/download/v0.6.2/kfctl_v0.6.2_linux.tar.gz
tar -xvf kfctl_v0.6.2_linux.tar.gz
mv ./kfctl /usr/local/bin/kfctl
rm -rf kfctl_v0.6.2_linux.tar.gz

