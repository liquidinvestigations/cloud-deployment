#!/bin/bash -ex
factory/factory login \
	--image cloud-x86_64 \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--share setup:/opt/setup \
	"$@"
