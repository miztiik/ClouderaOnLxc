#!/usr/bin/perl
#Get the network configs setup

# Check and install if you have EPEL Packages.
# https://fedoraproject.org/wiki/EPEL
yum -y install epel-release

#Check network configs
cd /etc/sysconfig/network-scripts

#Install yum presto
yum -y install yum-presto

yum -y update
yum -y clean all

#Get the necessary tools for lxc
yum -y libcgroup

#Start the Control Groups (cgroups) service, cgconfig, and configure the service to start at boot time.
service cgconfig start
chkconfig cgconfig on

# Get the network bridge virtualization bins
yum -y install libvirt bridge-utils

# Start the virtualization management service, libvirtd, and configure the service to start at boot time.
service libvirtd start
chkconfig libvirtd on

#Finally the lxc container bins
yum -y install lxc lxc-templates 





