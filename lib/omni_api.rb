require 'singleton'
require 'active_support'

require 'omni_api/version'
require 'omni_api/config'

module OmniApi
  extend ActiveSupport::Autoload

  autoload :Factories
  autoload :Concerns
  autoload :Resources
end