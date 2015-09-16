require 'bundler/setup'
Bundler.setup

require 'rspec/its'
require 'OmniApi'
OmniApi.config.base_url = 'http://localhost:9292/api/v1'
OmniApi.config.client_access_token = 'random'