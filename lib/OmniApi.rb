require 'singleton'
require 'active_resource'

require 'OmniApi/version'
require 'OmniApi/config'

module OmniApi
end

root_dir = File.expand_path('../OmniApi', __FILE__)
Dir.glob(File.join(root_dir, 'concerns', '**', '*.rb')).each { |f| require(f) }
Dir.glob(File.join(root_dir, '**', '*.rb')).each { |f| require(f) }