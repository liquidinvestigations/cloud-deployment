#!/bin/bash -ex

CORE_REPO=https://github.com/liquidinvestigations/core.git

if [ ! -d "core" ]; then
	git clone $CORE_REPO
fi

factory/factory run \
	--image liquid-cloud-x86_64 \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--share core:/opt/liquid-core/liquid-core \
	--tcp 10080:80 \
	--tcp 10022:22 \
	/mnt/scripts/liquid_vm_boot.sh \
	"$@"
