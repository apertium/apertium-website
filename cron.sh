#!/bin/bash
set -e
set -o pipefail

df -h /var/lib/docker
time ./upgrade.sh
docker stop apertium-beta
docker rm apertium-beta
./start.sh
docker system prune -f
df -h /var/lib/docker
