require 'active_resource'

module OmniApi
  module Resources
    root_dir = File.expand_path('../resources', __FILE__)
    Dir.glob(File.join(root_dir, '**', '*.rb')).each { |f| require(f) }
  end
end