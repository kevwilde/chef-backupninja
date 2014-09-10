#
# Cookbook Name:: backupninja
# Recipe:: default
#
# Copyright 2014, Kevin Van Wilder
#
#
# Installs backupninja on the machine.
#

package node['backupninja']['backupninja_package_name'] do
	action :install
end

package node['backupninja']['rdiff_backup_package_name'] do
	action :install
end

template node['backupninja']['general_configfile'] do
	source 'backupninja.conf.erb'
	owner 'root'
end