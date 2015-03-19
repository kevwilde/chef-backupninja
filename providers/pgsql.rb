include Chef::DSL::IncludeRecipe

action :create do

	backupninja new_resource.name do
		type 			'pgsql'
		priority 		new_resource.priority
		description		new_resource.description
		when_executed	new_resource.when_executed
		options({
			'databases' => new_resource.databases,
			'backupdir' => new_resource.backupdir,
			'compress' => new_resource.compress,
			'vsname' => new_resource.vsname
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
