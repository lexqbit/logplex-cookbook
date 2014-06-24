# Support whyrun
def whyrun_supported?
  true
end

action :call do
  #if @current_resource.exists
  #  Chef::Log.info "#{ @new_resource } already exists - nothing to do."
  #else
    converge_by("Call erlang #{ @new_resource }") do
      do_erl_call
    end
  #end
end

def do_erl_call
  erl_call new_resource.name do
    code      new_resource.code
    node_name "logplex@#{node['logplex']['instance_name']}"
    cookie    node['logplex']['cookie']
  end
end
