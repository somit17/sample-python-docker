#!/bin/bash

# Install KIND
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
echo "✅ Kind installed successfully."


# Install kubectl
echo "📦 Installing kubectl (latest stable version)..."
VERSION=$(curl -Ls https://dl.k8s.io/release/stable.txt)
echo "VERSION - ${VERSION}....."
INSTALL_DIR="/usr/local/bin"
URL="https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"
curl -LO "$URL"
chmod +x kubectl
sudo mv kubectl $INSTALL_DIR/
echo "✅ kubectl installed successfully."


#Check versions
echo
echo "🔍 Installed Versions :-"
kind --version
kubectl version --client --output=yaml

echo
echo "🎉Kind, and kubectl installation complete!"
