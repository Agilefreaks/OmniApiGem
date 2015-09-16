module OmniApi
  module Concerns
    root_dir = File.expand_path('../concerns', __FILE__)
    Dir.glob(File.join(root_dir, '**', '*.rb')).each { |f| require(f) }
  end
end