include Chef::DSL::IncludeRecipe

action :create do
	
	backupninja new_resource.name do
		type 			'rdiff'
		priority 		new_resource.priority
		description		new_resource.description
		when_executed	new_resource.when_executed
		options({
			'source' => {
				'label' => new_resource.source_label,
				'type' => new_resource.source_type,
				'keep' => new_resource.source_keep,
				'include' => new_resource.source_include,
				'exclude' => new_resource.source_exclude
			},
			'dest' => {
				'type' => new_resource.dest_type,
				'host' => new_resource.dest_host,
				'directory' => new_resource.dest_directory,
				'user' => new_resource.dest_user
			},
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
