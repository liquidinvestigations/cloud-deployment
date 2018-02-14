#!/bin/bash -ex
factory/factory run \
	--image liquid-cloud-x86_64 \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--share ../repos/setup:/opt/setup \
	--tcp 10080:80 \
	--tcp 10022:22 \
	/mnt/scripts/liquid_vm_test.sh \
	"$@"
