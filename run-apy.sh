#!/bin/bash

LANG='C.UTF-8' apertium-apy \
	-j1 \
	-n1 \
	-i2 \
	-u3 \
	-m300 \
	-r1000 \
	-d \
	-P /home/apertium/logs/ \
	-l /usr/share/apertium-apy/langNames.db \
	/usr/share/apertium/
