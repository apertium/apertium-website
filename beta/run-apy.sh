#!/bin/bash

cd /usr/share/apertium-apy/tools
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
        --fasttext-model /usr/share/apertium-apy/lid.beta.ftz \
	/usr/share/apertium/
