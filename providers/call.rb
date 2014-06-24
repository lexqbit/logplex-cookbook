# Support whyrun
def whyrun_supported?
  true
end

action :call do
  converge_by("Call erlang #{ @new_resource }") do
    do_erl_call
  end
end

def wait_for_erl
  # block until erl vm is up
  t = node['erlang']['erl_call']['timeout'] || 60
  Timeout.timeout(t) do
    while true
      if erl_ready?
        break
      else
        Chef::Log.info('Waiting for erl vm to become available...')
        sleep 5
      end
    end
  end
rescue Timeout::Error
  raise "Timed out waiting for erlang vm after #{t} seconds"
end

def erl_ready?
  cmd = Mixlib::ShellOut.new("echo 'logplex_app:config().' | erl_call -c #{node['logplex']['cookie']} -e -name logplex@#{node['logplex']['instance_name']}")
  cmd.run_command
  cmd.error? ? false : true
end

def do_erl_call
  wait_for_erl
  erl_call new_resource.name do
    code new_resource.code
    node_name "logplex@#{node['logplex']['instance_name']}"
    cookie node['logplex']['cookie']
  end
end
