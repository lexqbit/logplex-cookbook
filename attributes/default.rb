default['logplex']['repo']['url'] = 'https://github.com/heroku/logplex.git'
default['logplex']['repo']['revision'] = 'v72.1'
default['logplex']['dir'] = '/opt/logplex'
default['logplex']['user'] = 'logplex'
default['logplex']['group'] = 'logplex'

default['logplex']['instance_name'] = node.name
default['logplex']['config_redis_url'] = 'redis://localhost:6379'
default['logplex']['redgrid_redis_url'] = 'redis://localhost:6379'
default['logplex']['stats_redis_url'] = 'redis://localhost:6379'
default['logplex']['local_ip'] = node.ipaddress
default['logplex']['cookie'] = '123'
default['logplex']['auth_key'] = '123'

default['logplex']['env'] = {
  'INSTANCE_NAME' => node['logplex']['instance_name'].strip,
  'LOGPLEX_CONFIG_REDIS_URL' => node['logplex']['config_redis_url'].strip,
  'LOGPLEX_REDGRID_REDIS_URL' => node['logplex']['redgrid_redis_url'].strip,
  'LOGPLEX_STATS_REDIS_URL' => node['logplex']['stats_redis_url'].strip,
  'LOCAL_IP' => node['logplex']['local_ip'].strip,
  'LOGPLEX_COOKIE' => node['logplex']['cookie'].strip,
  'LOGPLEX_AUTH_KEY' => node['logplex']['auth_key'].strip,
  'HOME' => "/home/#{node['logplex']['user']}/"
}

default['logplex']['processes'] = 1
default['logplex']['proc_start'] = 8001
