#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/usr/www" do
  owner "root"
  group "root"
  recursive true
  mode 0755
  action:create
end

login_users = data_bag('users')
login_users.each do |id|
  u = data_bag_item('users', id)
  user u['id'] do
    shell    u['shell']
    password u['password']
    supports :manage_home => true, :non_unique => false
    action   [:create]
  end
end

group 'wheel' do
  action [:modify]
  members ['banchikichi']
  append true
end
