require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe 'logplex installation' do

  it 'should have logplex files' do
    expect(file('/opt/logplex/README.md')).to be_file
  end

  it 'should have supervisor configured' do
    expect(file('/etc/supervisor.d/logplex-service.conf')).to be_file
  end

end

describe 'logplex running' do

  it 'should have logplex running' do
    expect(service('logplex-service:logplex-service-8001')).to be_running.under('supervisor')
  end

  it 'should have port 8001 listening' do
    expect(port(8001)).to be_listening
  end
end