include Chef::DSL::IncludeRecipe

action :create do
	filename = "#{new_resource.priority}-#{new_resource.name}.#{new_resource.type}"
	backup_job_file_location = "#{node['backupninja']['configdirectory']}/#{filename}"

	template backup_job_file_location do
		source "backupconfiguration.ini.erb"
		variables(
			:options => new_resource.options,
			:when_executed => new_resource.when_executed,
			:description => new_resource.description
		)
	end
end


action :delete do
	filename = "#{new_resource.priority}-#{new_resource.name}.#{new_resource.type}"
	backup_job_file_location = "#{node['backupninja']['configdirectory']}/#{filename}"

	file backup_job_file_location do
		action :delete
	end
end
