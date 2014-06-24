#
# Cookbook Name:: logplex
# Recipe:: default
#
# Copyright 2014, RStudio, inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'erlang'
include_recipe 'git'
include_recipe 'supervisor'

group node['logplex']['group'] do
end

# create logplex user
user node['logplex']['user'] do
  gid node['logplex']['group']
  shell '/bin/false'
  system true
end

# create logplex directory
# directory node['logplex']['dir'] do
#  owner node['logplex']['user']
#  group node['logplex']['group']
#  mode  00644
#  action :create
# end

# git clone logplex source code
git node['logplex']['dir'] do
  #  user node['logplex']['user']
  #  group node['logplex']['group']
  repository node['logplex']['repo']['url']
  action :checkout
  revision node['logplex']['repo']['revision']
end

bash 'setup-logplex' do
  cwd node['logplex']['dir']
  code <<-EOF
    ./rebar --config public.rebar.config get-deps compile
  EOF
end

# configure lucid-server service
supervisor_service 'logplex-service' do
  process_name 'logplex-service-%(process_num)s'
  directory node['logplex']['dir']
  environment node['logplex']['env']
  user node['logplex']['user']
  numprocs node['logplex']['processes']
  numprocs_start node['logplex']['proc_start']
  command 'erl -name logplex@`hostname` ' \
          '-pa ebin ' \
          '-env ERL_LIBS ' \
          'deps ' \
          '-s logplex_app ' \
          '-setcookie ${LOGPLEX_COOKIE} ' \
          '-config sys'
  action :enable
end
