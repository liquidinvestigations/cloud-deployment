#!/bin/bash -ex

./init.sh

LIQUID_CLOUD=https://jenkins.liquiddemo.org/job/liquidinvestigations/job/setup/view/change-requests/job/master/lastSuccessfulBuild/artifact/liquid-cloud-x86_64-raw.img.xz

# download the liquid vm
mkdir -pv factory/images/liquid-cloud-x86_64
curl -L $LIQUID_CLOUD | xzcat > factory/images/liquid-cloud-x86_64/disk.img
echo '{"login": {"username": "liquid", "password": "liquid"}}' > factory/images/liquid-cloud-x86_64/config.json

set +x
echo ""
echo "DONE: Downloaded liquid-cloud image"
