#!/bin/bash -ex

prereq=https://jenkins.liquiddemo.org/job/setup-prerequisites/job/master/lastSuccessfulBuild/artifact/liquid-cloud-x86_64-prerequisites.img.gz

cp setup/jenkins-config.yml setup/ansible/vars/config.yml
ls images || mkdir images
ls images/pre.img.gz || wget -q $prereq -O images/pre.img.gz
zcat images/pre.img.gz > images/ubuntu-x86_64-raw.img

# build one
factory/factory run --image cloud-x86_64 --smp 4 --memory 2048 --share setup:/mnt/setup --share images:/mnt/images /mnt/setup/bin/jenkins_build /mnt/setup/bin/build_image cloud --image /mnt/images/ubuntu-x86_64-raw.img
# build two
factory/factory run --image cloud-x86_64 --smp 4 --memory 2048 --share setup:/mnt/setup --share images:/mnt/images /mnt/setup/bin/jenkins_build /mnt/setup/bin/build_image cloud --image /mnt/images/ubuntu-x86_64-raw.img

cp images/ubuntu-x86_64-raw.img factory/images/liquid-cloud-x86_64/disk.img

factory/factory run --image cloud-x86_64 --share setup:/mnt/setup --share factory/images/liquid-cloud-x86_64:/mnt/liquid /mnt/setup/bin/with-image-chroot /mnt/liquid/disk.img bash /opt/setup/ci/prepare-image-for-testing
