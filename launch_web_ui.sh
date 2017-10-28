#!/bin/bash -ex
factory/factory --platform liquid-cloud-x86_64 \
	run \
	--smp 4 \
	--memory 2048 \
	--share guest-scripts:/mnt/scripts \
	--share web-ui:/opt/web-ui \
	--tcp 10080:80 \
	--tcp 10022:22 \
	/mnt/scripts/liquid_vm_boot.sh
