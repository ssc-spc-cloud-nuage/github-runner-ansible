#!/bin/bash -e
################################################################################
##  File:  docker.sh
##  Desc:  Installs Docker
################################################################################

curl -fsSL https://get.docker.com -o- | sh

# Use ephemeral SSD for Docker root directory (speeds up builds)
mkdir /mnt/docker || true
echo '{"data-root": "/mnt/docker"}' >/etc/docker/daemon.json
service docker restart

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected"
if ! command -v docker; then
    echo "docker was not installed"
    exit 1
fi