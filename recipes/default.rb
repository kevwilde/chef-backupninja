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


backupninja_rdiff 'tmpbackup' do
	priority 		10
	description		'jos, tes ek ie, da macheert ie ni zenne'
	when_executed	'hourly'
	
	source_keep		185
	source_include	[
		'/var/spool/cron/crontabs',
		'/var/backups',
		'/home',
		'/usr/local/bin'
	]
	source_exclude	[
		'/home/*/.gnupg',
		'/home/*/.ssh'
	]

	dest_host		'ow-backups'
	dest_directory	'/backups'

end

