#!/bin/bash -e
################################################################################
##  File:  docker.sh
##  Desc:  Installs rootless Docker
################################################################################

curl -fsSL https://get.docker.com/rootless | sh

USER_NAME="$(whoami)"
echo export DOCKER_HOST=unix:///run/user/$UID/docker.sock >>/home/$USER_NAME/.profile
echo export PATH=/home/$USER_NAME/bin:$PATH >>/home/$USER_NAME/.profile

# config runner for rootless docker
cd /opt/actions-runner/
echo DOCKER_HOST=unix:///run/user/$USER_ID/docker.sock >>.env
echo PATH=/home/$USER_NAME/bin:$PATH >>.env

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected"
if ! command -v docker; then
    echo "docker was not installed"
    exit 1
fi