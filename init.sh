#!/bin/bash -e

FACTORY_REPO=https://github.com/liquidinvestigations/factory.git
WEB_UI_REPO=https://github.com/liquidinvestigations/web-ui.git
UI_TEMPLATES_REPO=https://github.com/liquidinvestigations/ui-templates.git

PROGRAM_LIST="git curl wget kitchen qemu-system-x86_64"
for program in $PROGRAM_LIST; do
	if ! which $program; then
		echo "Error: $program is not installed."
		exit 1
	fi
done

# download dependencies
if [ ! -d "factory" ]; then
	git clone $FACTORY_REPO
fi

( cd factory; git checkout master; git pull )
if [ ! -d "ui-templates" ]; then
	git clone $UI_TEMPLATES_REPO
fi

if [ ! -d "web-ui" ]; then
	git clone $WEB_UI_REPO
fi

( cd factory; git checkout master; git pull )
( cd web-ui; git checkout master; git pull )
( cd ui-templates; git checkout master; git pull )
