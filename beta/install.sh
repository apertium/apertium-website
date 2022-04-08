#!/bin/bash
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain
export PROGRESS_NO_TRUNC=1

docker build --squash --pull -t apertium-beta -f Dockerfile.install .
./upgrade.sh
