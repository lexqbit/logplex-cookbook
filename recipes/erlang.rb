#
# Cookbook Name:: logplex
# Recipe:: erlang
#
# Copyright 2014, RStudio, inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'erlang'

# fix erl_call symlink
# for some reason the erlang cookbook create symlinks with wildcards (`*`) in the link. odd.
link node['erlang']['erl_call']['sym_path'] do
  to node['erlang']['erl_call']['install_path']
end
