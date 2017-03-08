echo "Running Yum Update.."
yum update -y
echo "Installing puppet..."
yum install puppetserver -y
yum install puppet -y
echo "Ensuring the puppet service is running"
service puppet start
#echo "Stoping firewall"
systemctl disable firewalld
systemctl stop firewalld
