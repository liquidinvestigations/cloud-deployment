#!/bin/bash -ex
factory/factory --platform liquid-cloud-x86_64 \
	run \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--tcp 10080:80 \
	--tcp 10022:22 \
	/mnt/scripts/liquid_vm_boot.sh
