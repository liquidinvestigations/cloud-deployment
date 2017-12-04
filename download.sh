#!/bin/bash -ex

./init.sh

UBUNTU_CLOUD=https://jenkins.liquiddemo.org/job/liquidinvestigations/job/factory/job/master/lastSuccessfulBuild/artifact/cloud-x86_64-image.tar.xz
LIQUID_CLOUD=https://jenkins.liquiddemo.org/job/liquidinvestigations/job/setup/view/change-requests/job/master/lastSuccessfulBuild/artifact/liquid-cloud-x86_64-raw.img.xz

mkdir -pv factory/images/cloud-x86_64
(
  cd factory/images/cloud-x86_64
  curl -L $UBUNTU_CLOUD > disk.tar.xz
  xzcat disk.tar.xz | tar -x
  rm disk.tar.xz
)

mkdir -pv factory/images/liquid-cloud-x86_64
(
  cd factory/images/liquid-cloud-x86_64
  curl -L $LIQUID_CLOUD > disk.img.xz
  xzcat disk.img.xz > disk.img
  rm disk.img.xz
  echo '{"login": {"username": "liquid", "password": "liquid"}}' > config.json
)

factory/factory run --share setup:/mnt/setup --share factory/images/liquid-cloud-x86_64:/mnt/liquid /mnt/setup/bin/with-image-chroot /mnt/liquid/disk.img bash /opt/setup/ci/prepare-image-for-testing

set +x
echo ""
echo "DONE: Downloaded and set up liquid-cloud image"
