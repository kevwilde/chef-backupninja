#
# Cookbook Name:: backupninja
# Recipe:: _sshkeypair
#
# Copyright 2014, Kevin Van Wilder
#
#
# Generates an ssh keypair for root user
#

# Generate SSH keypair

chef_gem 'sshkey'

pkey = '/root/.ssh/id_rsa'

require 'sshkey'
sshkey = SSHKey.generate(
  type: 'RSA',
  comment: "root@#{node['hostname']}"
)

# Create ~/.ssh directory
directory "/root/.ssh" do
  owner 'root'
  group 'root'
  mode 00700
end

# Store private key on disk
template pkey do
  owner 'root'
  group 'root'
  variables(ssh_private_key: sshkey.private_key)
  mode 00600
  action :create_if_missing
end

# Store public key on disk
template "#{pkey}.pub" do
  owner 'root'
  group 'root'
  variables(ssh_public_key: sshkey.ssh_public_key)
  mode 00644
  action :create_if_missing
end

# Save public key to chef-server as jenkins_pubkey 
ruby_block 'node-save-pubkey' do
  block do
    node.set_unless["backupclient_pubkey"] = File.read("#{pkey}.pub")
    node.save unless Chef::Config['solo']
  end
end