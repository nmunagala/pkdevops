#!/bin/bash

echo -e "\n#############################################\n#\tThis VM is provisioned using Vagrant\n\n#\tWelcome to Gitlab Enterprise Server\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" > /etc/motd

useradd -d /home/gitlab -s /bin/bash -m gitlab
echo -e "gitlab\ngitlab" | passwd gitlab

sudo yum install curl openssh-server -y
sudo systemctl enable sshd
sudo systemctl start sshd
sudo yum install postfix -y
sudo systemctl enable postfix
sudo systemctl start postfix
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
yum install gitlab-ee -y
gitlab-ctl reconfigure
