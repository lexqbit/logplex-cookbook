# Support whyrun
def whyrun_supported?
  true
end

action :call do
  converge_by("Call erlang #{ @new_resource }") do
    do_erl_call
  end
end

def do_erl_call
  erl_call new_resource.name do
    code new_resource.code
    node_name "logplex@#{node['logplex']['instance_name']}"
    cookie node['logplex']['cookie']
  end
end
