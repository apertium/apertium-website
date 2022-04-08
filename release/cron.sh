#!/bin/bash
set -euo pipefail
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain
export PROGRESS_NO_TRUNC=1

readonly here="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
readonly public_html=/home/frontend/public_html

# Docker image
df -h /var/lib/docker
time ./upgrade.sh
docker stop apertium-release
docker rm apertium-release
./start.sh
docker system prune -f
df -h /var/lib/docker

# Website
cd ~frontend/apertium-html-tools
git pull --all --autostash --rebase

cp "$here/config.ts" .

readonly tmp_dist="$(mktemp -d)"
trap 'rm -rf "$tmp_dist"' EXIT

docker build --squash -t apertium-html-tools .
docker run --rm -v "$tmp_dist":/root/dist apertium-html-tools
docker system prune -f

rsync -avc --delete "$tmp_dist/" "$public_html/"

chown -R frontend:frontend ~frontend
chmod -R go-rwx ~frontend
