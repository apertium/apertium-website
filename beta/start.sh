#!/bin/bash
docker run -d --restart=unless-stopped --memory 20480m --memory-swap 30720m -v /home/beta/logs:/home/apertium/logs -p 2738:2737 --name apertium-beta apertium-beta
