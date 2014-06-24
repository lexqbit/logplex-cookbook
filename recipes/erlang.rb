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
link node[:erlang][:erl_call][:install_path] do
  to Dir.glob("/usr/lib/erlang/lib/**/erl_call").first
end
