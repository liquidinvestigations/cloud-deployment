#!/bin/bash -ex

./init.sh

mkdir -pv factory/images/cloud-x86_64
UBUNTU_CLOUD=https://jenkins.liquiddemo.org/job/liquidinvestigations/job/factory/job/master/lastSuccessfulBuild/artifact/cloud-x86_64-image.tar.xz
curl -L $UBUNTU_CLOUD | xzcat | tar -x -C factory/images/cloud-x86_64
