#!/bin/bash
docker run -d --restart=unless-stopped --memory 20480m --memory-swap 30720m -v /home/frontend/logs:/home/apertium/logs -p 2737:2737 --name apertium-release apertium-release
