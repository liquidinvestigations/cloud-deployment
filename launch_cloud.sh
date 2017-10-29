#!/bin/bash -ex
factory/factory --platform cloud-x86_64 \
	login \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--share web-ui:/opt/web-ui \
	--tcp 10080:80 \
	--tcp 10022:22
