module OmniApi
  module Factories
    root_dir = File.expand_path('../factories', __FILE__)
    Dir.glob(File.join(root_dir, '**', '*.rb')).each { |f| require(f) }
  end
end