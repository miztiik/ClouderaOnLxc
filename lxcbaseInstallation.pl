#Get the network configs setup

#Check network configs
cd /etc/sysconfig/network-scripts

#Install yum presto
yum -y install yum-presto

yum -y update
yum -y clean all