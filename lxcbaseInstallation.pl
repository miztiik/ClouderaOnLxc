#!/usr/bin/perl
#Get the network configs setup

## Installing and Configuring the Software
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
yum -y install libvirt bridge-utils libvirt-client python-virtinst

# Start the virtualization management service, libvirtd, and configure the service to start at boot time.
service libvirtd start
chkconfig libvirtd on

#Finally the lxc container bins
yum -y install lxc lxc-templates

#Lets setup the networks
chkconfig NetworkManager off
chkconfig network on
service NetworkManager stop
service network start

#Lets create a bridge network on eth3 on the host
cat > /etc/sysconfig/network-scripts/ifcfg-eth2 << EOF
DEVICE=eth2
TYPE=Ethernet
ONBOOT=yes
BRIDGE=br0
USERCTL=no
IPV6INIT=no
EOF

cat > /etc/sysconfig/network-scripts/ifcfg-br0 << EOF
HOSTNANE=host1
DEVICE=br0
ONBOOT=yes
BOOTPROTO=static
DELAY=0
TYPE=Bridge
IPADDR=192.168.56.100
NETWORK=192.168.0.0
NETMASK=255.255.255.0
GATEWAY=192.168.0.1
MTU=1500
DNS1=192.168.0.1
IPV6INIT=no
USERCTL=no
EOF

service network restart

## Creating and Starting a Container
# I prefer using the centos templates to create them than to bootstrap
## -n option gives the name of the lxc container name 
## -t specifies the tempate to be used.
lxc-create -n lxc-base -t centos --lxcpath=/root/lxcContainers

## Change the root password provided by the template.

# Starting the container
lxc-start -n lxc-base

# To list containers
lxc-ls

# To display the containers that are running on the host system, specify the --active option.
lxc-ls --active

#To Check the status of a container
lxc-info -n lxc-base

# To shut down the container in an orderly manner.
lxc-shutdown -n lxc-base

#You can also make a clone (a copy) of a container
#lxc-clone -o <existing container> -n <new container name>



