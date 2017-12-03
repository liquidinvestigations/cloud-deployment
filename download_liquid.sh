#!/bin/bash -ex

./init.sh

LIQUID_CLOUD=https://jenkins.liquiddemo.org/job/liquidinvestigations/job/setup/view/change-requests/job/master/lastSuccessfulBuild/artifact/liquid-cloud-x86_64-raw.img.xz

# download the liquid vm
mkdir -pv factory/images/liquid-cloud-x86_64
(
  cd factory/images/liquid-cloud-x86_64
  curl -L $LIQUID_CLOUD > disk.img.xz
  xzcat disk.img.xz > disk.img
  rm disk.img.xz
  echo '{"login": {"username": "liquid", "password": "liquid"}}' > config.json
)

set +x
echo ""
echo "DONE: Downloaded liquid-cloud image"
