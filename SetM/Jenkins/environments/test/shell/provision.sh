#!/bin/bash

echo -e "\n#############################################\n#\tThis VM is provisioned using Vagrant\n\n#\tWelcome to Gitlab Enterprise Server\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

apt-get update; apt-get install gcc make virtualbox-guest-dkms -y;

apt-get install curl openssh-server ca-certificates postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

gitlab-ctl reconfigure