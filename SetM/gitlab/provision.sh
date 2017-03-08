#!/bin/bash

echo -e "\n#############################################\n#\tThis VM is provisioned using Vagrant\n\n#\tWelcome to Gitlab Enterprise Server\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" > /etc/motd

useradd -d /home/vamshi -s /bin/bash -m vamshi
echo -e "vamshi\nvamshi" | passwd vamshi
usermod -aG sudo vamshi

apt-get install curl openssh-server ca-certificates postfix -y

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

apt-get install gitlab-ce

gitlab-ctl reconfigure
