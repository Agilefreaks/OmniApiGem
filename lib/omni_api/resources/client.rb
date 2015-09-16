require_relative 'base_client_model'

module OmniApi
  module Resources
    class Client < BaseClientModel
      attr_accessible :id, :name, :scopes

      def locale
        'ro'
      end
    end
  end
end
