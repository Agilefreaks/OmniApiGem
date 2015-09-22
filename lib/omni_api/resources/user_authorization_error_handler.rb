module OmniApi
  module Resources
    class UserAuthorizationErrorHandler
      def handle(error, connection, arguments)
        raise error unless error.is_a?(ActiveResource::UnauthorizedAccess)
        Oauth2::Token.refresh_for(OmniApi.config.user_refresh_token)
        new_connection = connection.clone
        new_connection.error_handler = nil
        new_connection.request(*arguments)
      end
    end
  end
end