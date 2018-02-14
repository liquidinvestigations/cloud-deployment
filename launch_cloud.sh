#!/bin/bash -ex
factory/factory login \
	--image cloud-x86_64 \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--share web-ui:/opt/web-ui \
	--tcp 10080:80 \
	--tcp 10022:22 \
	"$@"
