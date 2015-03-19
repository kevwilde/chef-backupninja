actions :create, :delete
default_action :create

attribute :name, :kind_of => String, :name_attribute => true, :required => true
attribute :priority, :kind_of => Integer, :required => true
attribute :description, :kind_of => String
attribute :when_executed, :kind_of => String
attribute :type, :kind_of => String
attribute :options, :kind_of => Hash




attribute :databases, :kind_of => String
attribute :backupdir, :kind_of => String
attribute :compress, :kind_of => String
attribute :vsname, :kind_of => String
