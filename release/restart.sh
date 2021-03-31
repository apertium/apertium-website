#!/bin/bash
cd /home/frontend/logs
STAMP=`date -u '+%Y%m%d-%H%M'`
mv -f apertium-apy.err apertium-apy.err-$STAMP
mv -f apertium-apy.log apertium-apy.log-$STAMP
docker restart apertium-release
find . -type f -name 'apertium-apy.*' -mtime +60 -exec rm -fv {} \;
