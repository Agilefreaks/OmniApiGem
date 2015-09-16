module OmniApi
  module Resources
    module Users
      class UserResource < UserAuthorizedResource
        self.site = "#{OmniApi.config.base_url}/user"
      end
    end
  end
end
