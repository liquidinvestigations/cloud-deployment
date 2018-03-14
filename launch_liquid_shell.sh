#!/bin/bash -ex
factory/factory login \
	--image liquid-cloud-x86_64 \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--tcp 10080:80 \
	--tcp 10022:22 \
	--tcp 1194:1194 \
	"$@"
