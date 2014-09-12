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
attribute :hotcopy, :kind_of => String
attribute :sqldump, :kind_of => String
attribute :sqldumpoptions, :kind_of => String
attribute :compress, :kind_of => String
attribute :nodata, :kind_of => String
attribute :vsname, :kind_of => String

### authentication ###
attribute :user, :kind_of => String

attribute :dbusername, :kind_of => String
attribute :dbpassword, :kind_of => String
attribute :dbhost, :kind_of => String

attribute :configfile, :kind_of => String