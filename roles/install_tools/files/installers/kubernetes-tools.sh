#!/bin/bash -e
################################################################################
##  File:  kubernetes-tools.sh
##  Desc:  Installs kubectl, helm, kustomize
################################################################################

## Install kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list

sudo curl -sSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl"
sudo chmod +x /usr/local/bin/kubectl

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Install kustomize
download_url="https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"
curl -s "$download_url" | bash
mv kustomize /usr/local/bin

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v kubectl; then
    echo "kubectl was not installed"
    exit 1
fi

if ! command -v helm; then
    echo "helm was not installed"
    exit 1
fi

echo "Testing to make sure that kustomize was installed"
if ! command -v kustomize; then
    echo "kustomize was not installed"
    exit 1
fi
