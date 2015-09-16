require_relative '../user_authorized_resource'

module OmniApi
  module Resources
    class User
      class UserResource < UserAuthorizedResource
        self.site = "#{OmniApi.config.base_url}/user"
      end
    end
  end
end
