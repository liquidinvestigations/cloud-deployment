#!/bin/bash -ex

WEB_UI_REPO=https://github.com/liquidinvestigations/web-ui.git

if [ ! -d "web-ui" ]; then
	git clone $WEB_UI_REPO
fi

factory/factory run \
	--image liquid-cloud-x86_64 \
	--smp 4 \
	--memory 4096 \
	--share guest-scripts:/mnt/scripts \
	--share web-ui:/opt/web-ui \
	--share ui-templates:/opt/ui-templates \
	--tcp 10080:80 \
	--tcp 10022:22 \
	/mnt/scripts/liquid_vm_boot.sh
