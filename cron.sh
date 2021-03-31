#!/bin/bash
set -e
set -o pipefail

# Docker image
df -h /var/lib/docker
time ./upgrade.sh
docker stop apertium-beta
docker rm apertium-beta
./start.sh
docker system prune -f
df -h /var/lib/docker

# Website
cd ~beta/apertium-html-tools
git pull --all --autostash --rebase
make clean
make
rsync -avc --delete build/ ../public_html/
