backupninja Cookbook
====================
The main highlights of this cookbook are the resources for managing backups. The following providers are currently implemented:

* `backupninja_rdiff`: backup action for rdiff-backup (incremental backups)
* `backupninja_mysql`: backup action for safe MySQL dumps

Requirements
------------

Chef version 0.11+

Platforms
---------

* Ubuntu

All other platforms are currently untested.

Resources/Providers
-------------------
These resources aim to expose an abstraction layer for generating the ini-style configuration files necessary to configure a backup job in backupninja.

If you wish to install backupninja, add the included `recipe[backupninja]` to your runlist or wrapper cookbook.

#### backupninja

Generic backupninja resource. This resource contains all the generic configuration data available in all the backup job-specific resources. This resource is in charge of the file naming-scheme and the generation of the INI-file.

##### Actions

* `:create`: create the ini file
* `:delete`: removes the ini file

##### Attribute Parameters

* `name`: name attribute. Short descriptive name that will be used in the filename.
* `priority`
* `description`
* `when_executed`
* `type`: the extension of the INI-file indication which procedure for backup will be used.
* `options`: Hash of additional values to appear in the INI-file.

More information of about ordering, naming and scheduling can be found [here](https://labs.riseup.net/code/projects/backupninja/wiki/Configuration#Global-configuration).

The `options` hash will be heavily used by the job-specific resources to fill in their additional parameters. 

Generation of these options depends on the class type of the hash value being used:

* Value is of type `Array`: A seperate "key = item" line will be generated for each item in the array.
* Value is of type `Hash`: the key will be used as a section `[key]` and the value should again be of type Hash. Everything in that hash will be generated as attributes inside this section.
* Everything else will simply be generated as "key = value"


#### backupninja_rdiff

Rdiff-specific job to make remote, incremental backups of the filesystem.

##### Actions

* `:create`: create the ini file
* `:delete`: removes the ini file

##### Attribute Parameters

The following attribute parameters are present alongside those in the `backupninja` resource:

The source section:
* `source_label`, String
* `source_type`, String
* `source_keep`, Integer
* `source_include`, Array
* `source_exclude`, Array

The dest (destination) section:
* `dest_type`, String
* `dest_host`, String
* `dest_directory`, String
* `dest_user`, String

More information about these attributes can be found [here](https://labs.riseup.net/code/projects/backupninja/wiki/Rdiff).

#### backupninja_mysql

MySQL-specific job to backup a mysql database using mysqldump.

##### Actions

* `:create`: create the ini file
* `:delete`: removes the ini file

##### Attribute Parameters

The following attribute parameters are present alongside those in the `backupninja` resource:

* `databases`, String
* `backupdir`, String
* `hotcopy`, String
* `sqldump`, String
* `sqldumpoptions`, String
* `compress`, String
* `nodata`, String
* `vsname`, String

* `user`, String
* `dbusername`, String
* `dbpassword`, String
* `configfile`, String

More information about these attributes can be found [here](https://labs.riseup.net/code/projects/backupninja/wiki/Mysql).

Attributes
----------

#### backupninja::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['backupninja']['backupninja_package_name']</tt></td>
    <td>String</td>
    <td>Package name for backupninja</td>
    <td><tt>'backupninja'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['rdiff_backup_package_name']</tt></td>
    <td>String</td>
    <td>Package name for rdiff-backup</td>
    <td><tt>'rdiff-backup'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['loglevel']</tt></td>
    <td>Integer</td>
    <td>
      Verbosity level for logging:
      <ul>
        <li>5: Debug and below</li>
        <li>4: Information and below</li>
        <li>3: Warnings and below</li>
        <li>2: Errors and below</li>
        <li>1: Fatal errors only</li>
      </ul>
    </td>
    <td><tt>4</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['reportemail']</tt></td>
    <td>String</td>
    <td>Backup summaries will be emailed to this address</td>
    <td><tt>'root'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['reportsuccess']</tt></td>
    <td>String</td>
    <td>When set to 'yes', a report email will be generated even
    if there was no error.</td>
    <td><tt>'yes'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['reportwarning']</tt></td>
    <td>String</td>
    <td>When set to 'yes', a report email will be generated even
    if there was no error.</td>
    <td><tt>'yes'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['logfile']</tt></td>
    <td>String</td>
    <td>All logs will be written to this file</td>
    <td><tt>'/var/log/backupninja.log'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['configdirectory']</tt></td>
    <td>String</td>
    <td>Directory where all the backup configuration files live</td>
    <td><tt>'/etc/backup.d'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['scriptdirectory']</tt></td>
    <td>String</td>
    <td>Where backupninja handler scripts are found</td>
    <td><tt>/usr/share/backupninja'</tt></td>
  </tr>
  <tr>
    <td><tt>['backupninja']['usecolors']</tt></td>
    <td>String</td>
    <td>Use colors in the log file</td>
    <td><tt>'yes'</tt></td>
  </tr>
</table>

Usage
-----
#### backupninja::default

Installs and configures a backupninja daemon on the machine. No backup tasks are added.

e.g.
Just include `backupninja` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[backupninja]"
  ]
}
```

To Do
-----

* Make job-specific resources more DRY-er
* Implement other job processes
* Change all `'yes'` attribute parameters from strings to booleans.
* Ensure only one of three allowed authorization techniques in the MySQL job can be configured in a resource.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Kevin Van Wilder <kevin@van-wilder.be>
