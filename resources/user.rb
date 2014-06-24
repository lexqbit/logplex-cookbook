actions :create, :delete
default_action :create

attribute :user, name_attribute: true, kind_of: String, required: true
attribute :password, kind_of: String, required: true
attribute :api, kind_of: String, default: 'full_api', equal_to: %w( full_api )
attribute :channel, kind_of: String, default: 'any_channel'
