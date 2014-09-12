include Chef::DSL::IncludeRecipe

action :create do
	
	backupninja new_resource.name do
		type 			'mysql'
		priority 		new_resource.priority
		description		new_resource.description
		when_executed	new_resource.when_executed
		options({
			'databases' => new_resource.databases,
			'backupdir' => new_resource.backupdir,
			'hotcopy' => new_resource.hotcopy,
			'sqldump' => new_resource.sqldump,
			'sqldumpoptions' => new_resource.sqldumpoptions,
			'compress' => new_resource.compress,
			'nodata' => new_resource.nodata,
			'vsname' => new_resource.vsname,
			'user' => new_resource.user,
			'dbusername' => new_resource.dbusername,
			'dbpassword' => new_resource.dbpassword,
			'dbhost' => new_resource.dbhost,
			'configfile' => new_resource.configfile,
		})
		action :create
	end

end

action :delete do
	filename = "#{new_resource.priority}-#{new_resource.name}.#{new_resource.type}"
	backup_job_file_location = "#{node['backupninja']['configdirectory']}/#{filename}"

	backupninja backup_job_file_location do
		action :delete
	end

end
