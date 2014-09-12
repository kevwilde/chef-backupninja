#
# Cookbook Name:: backupninja
# Recipe:: rdiff_backup_server
#
# Copyright 2014, Kevin Van Wilder
#
#
# Installs and prepares the server to receive remote rdiff backups
#

package node['backupninja']['rdiff_backup_package_name'] do
	action :install
end

backup_nodes = search(:node, 'backupclient_pubkey:*')

user node['backupninja']['rdiff_backup_server_user'] do
	comment "Backup User for backupninja"
	home "/home/#{node['backupninja']['rdiff_backup_server_user']}/"
	shell '/bin/bash'
	supports :manage_home => true
end

directory "/home/#{node['backupninja']['rdiff_backup_server_user']}/.ssh" do
	owner node['backupninja']['rdiff_backup_server_user']
end

file "/home/#{node['backupninja']['rdiff_backup_server_user']}/.ssh/authorized_keys" do
	owner node['backupninja']['rdiff_backup_server_user']
	mode '644'
	content backup_nodes.map { |node| node['backupclient_pubkey'] }.join('\n')
end

directory node['backupninja']['rdiff_backup_server_directory'] do
	owner node['backupninja']['rdiff_backup_server_user']
	group node['backupninja']['rdiff_backup_server_user']
end