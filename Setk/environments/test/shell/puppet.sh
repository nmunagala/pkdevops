echo "Adding puppet repo"
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
echo "installing puppet"
sudo yum install puppet -y
echo "ensure puppet service is running"
sudo service puppet start
