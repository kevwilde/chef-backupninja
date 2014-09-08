backupninja Cookbook
====================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - backupninja needs toaster to brown your bagel.

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

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
