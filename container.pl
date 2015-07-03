#!/usr/bin/perl
	
#Update the installation and clean up
yum update
yum clean all

#setup presto for small download size
yum -y install yum-presto

#rsync needed by lxc
yum -y install rsync libcgroup

#Make cgroup run on runlevel 3
chkconfig –level 3 cgconfig on

# Download lxc and templates
yum -y install lxc lxc-templates

#Setting up the bridge adapter on host
brctl addbr virbr0
ifconfig virbr0 192.168.56.51 netmask 255.255.255.0 up

#Create your first lxc with templates name as lxc-base
lxc-create -n lxc-base -t centos --lxcpath=/var/lib/lxc/

