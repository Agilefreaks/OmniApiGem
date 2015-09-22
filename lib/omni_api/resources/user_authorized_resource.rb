require_relative 'base_client_model'
require_relative 'user'

module OmniApi
  module Resources
    class UserAuthorizedResource < BaseClientModel
      cattr_accessor :static_headers
      self.static_headers = headers

      def self.headers
        new_headers = static_headers.clone
        new_headers['Authorization'] = OmniApi.config.user_access_token
        new_headers
      end

      def self.connection(refresh = false)
        @connection = create_new_connection if refresh || @connection.nil?
        super
      end

      protected

      def self.create_new_connection
        connection = Connection.new(site, format)
        connection.error_handler = UserAuthorizationErrorHandler.new
        connection
      end
    end
  end
end