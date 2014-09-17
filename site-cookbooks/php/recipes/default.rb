#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# remi repository導入
remote_file "/tmp/#{node['remi']['file_name']}" do
  source "#{node['remi']['remote_uri']}"
  not_if { ::File.exists?("/tmp/#{node['remi']['file_name']}") }
end

package node['remi']['file_name'] do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node['remi']['file_name']}"
end

# phpインストール
%w[
  php
  php-pdo
  php-mbstring
  php-mysqlnd
].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=remi --enablerepo=remi-php55'
  end
end

# php設定
#template "php.ini" do
#  path "/etc/php.ini"
#  source "php.ini.erb"
#  mode 0644
#  notifies :restart, 'service[httpd]'
#end
