#!/bin/bash
set -euo pipefail

readonly here="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
readonly public_html=/home/beta/public_html

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

cp "$here/config.ts" .

readonly tmp_dist="$(mktemp -d)"
trap 'rm -rf "$tmp_dist"' EXIT

docker build -t apertium-html-tools-beta .
docker run --rm -v "$tmp_dist":/root/dist apertium-html-tools-beta

chown -R beta:beta "$tmp_dist/"
rsync -avc --delete "$tmp_dist/" "$public_html"
