
# Installation

default['backupninja']['backupninja_package_name'] = 'backupninja'
default['backupninja']['rdiff_backup_package_name'] = 'rdiff-backup'

# Configuration

default['backupninja']['general_configfile'] = '/etc/backupninja.conf'

# Global Configurations

default['backupninja']['loglevel'] = 4
default['backupninja']['reportemail'] = 'root'
default['backupninja']['reportsuccess'] = 'yes'
default['backupninja']['reportwarning'] = 'yes'
default['backupninja']['logfile'] = '/var/log/backupninja.log'
default['backupninja']['configdirectory'] = '/etc/backup.d'
default['backupninja']['scriptdirectory'] = '/usr/share/backupninja'
default['backupninja']['usecolors'] = 'yes'

# Server Configuration

default['backupninja']['rdiff_backup_server_user'] = 'backups'
default['backupninja']['rdiff_backup_server_directory'] = '/backups'