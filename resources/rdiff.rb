actions :create, :delete
default_action :create

attribute :name, :kind_of => String, :name_attribute => true, :required => true
attribute :priority, :kind_of => Integer, :required => true
attribute :description, :kind_of => String
attribute :when_executed, :kind_of => String
attribute :type, :kind_of => String
attribute :options, :kind_of => Hash

attribute :source_label, :kind_of => String
attribute :source_type, :kind_of => String
attribute :source_keep, :kind_of => Integer
attribute :source_include, :kind_of => Array
attribute :source_exclude, :kind_of => Array

attribute :dest_type, :kind_of => String
attribute :dest_host, :kind_of => String
attribute :dest_directory, :kind_of => String
attribute :dest_user, :kind_of => String