module OmniApi
  module Resources
    class UserAuthorizationErrorHandler
      def handle(error, connection, arguments)
        raise error unless error.is_a?(ActiveResource::UnauthorizedAccess)
        token = Oauth2::Token.refresh_for(OmniApi.config.user_refresh_token) rescue nil
        raise error unless token && token.persisted?
        connection.request(*arguments)
      end
    end
  end
end