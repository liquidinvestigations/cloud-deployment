#!/bin/bash -e

FACTORY_REPO=https://github.com/liquidinvestigations/factory.git

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
