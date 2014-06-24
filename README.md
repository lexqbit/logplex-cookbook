logplex Cookbook
================
This cookbook installs and configures [logplex](https://github.com/heroku/logplex)

Requirements
------------
Logplex requires [redis](http://redis.io/) to work. You instance of redis can run on localhost or remotely.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### logplex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['logplex']['repo']['url']</tt></td>
    <td>String</td>
    <td>a git url to get the logplex source code</td>
    <td><tt>https://github.com/heroku/logplex.git</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['repo']['revision']</tt></td>
    <td>String</td>
    <td>git tag to pull from (ie `master`)</td>
    <td><tt>v72.1</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['dir']</tt></td>
    <td>Path</td>
    <td>Path to install logplex source files</td>
    <td><tt>/opt/logplex</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['user']</tt></td>
    <td>String</td>
    <td>user to run logplex as</td>
    <td><tt>logplex</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['group']</tt></td>
    <td>String</td>
    <td>group to run logplex as</td>
    <td><tt>logplex</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['instance_name']</tt></td>
    <td>String</td>
    <td>hostname erlang should use. `hostname` is suggeseted</td>
    <td><tt>node.name</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['config_redis_url']</tt></td>
    <td>redis url</td>
    <td>URL to connect to redis</td>
    <td><tt>redis://localhost:6379</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['redgrid_redis_url']</tt></td>
    <td>redis url</td>
    <td>??</td>
    <td><tt>redis://localhost:6379</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['local_ip']</tt></td>
    <td>IP address</td>
    <td>??</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['cookie']</tt></td>
    <td>String</td>
    <td>Erlang cookie (alphanum)</td>
    <td><tt>123</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['auth_key']</tt></td>
    <td>String</td>
    <td>Auth key (should not be the same as the cookie)</td>
    <td><tt>123</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['env']</tt></td>
    <td>ENV vars</td>
    <td>Environment variables to pass to supervisor</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['processes']</tt></td>
    <td>int</td>
    <td>Number of logplex processes to run</td>
    <td><tt>1</tt></td>
  </tr>
  <tr>
    <td><tt>['logplex']['proc_start']</tt></td>
    <td>int</td>
    <td>Port to start the logplex processes to run on</td>
    <td><tt>8001</tt></td>
  </tr>
</table>

Usage
-----
#### logplex::default

e.g.
Just include `logplex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[logplex]"
  ]
}
```

#### logplex\_call
Make an erlang call to logplex

```ruby
logplex_call "lookup_user" do
  code %q(logplex_cred:lookup(<<"myuser">>))
end
```

#### logplex\_user
Manage logplex users. You can also manage logplex users via the data bag ('logplex', 'users')

```ruby
logplex_user "myuser" do
  password  "mypasswd"
  api       "full_api"
  channel   "any_channel"
  action    :create
end
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add\_component\_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [Chad Barraford](https://github.com/CBarraford)
