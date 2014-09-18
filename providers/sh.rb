include Chef::DSL::IncludeRecipe

action :create do

	filename = "#{new_resource.priority}-#{new_resource.name}.#{new_resource.type}"
	backup_job_file_location = "#{node['backupninja']['configdirectory']}/#{filename}"

	file backup_job_file_location do
		content 	new_resource.content
		mode		"0660"
		action 		:create
	end

	new_resource.updated_by_last_action(true)
end


action :delete do
	filename = "#{new_resource.priority}-#{new_resource.name}.#{new_resource.type}"
	backup_job_file_location = "#{node['backupninja']['configdirectory']}/#{filename}"

	backupninja backup_job_file_location do
		action :delete
	end

	new_resource.updated_by_last_action(true)
end
