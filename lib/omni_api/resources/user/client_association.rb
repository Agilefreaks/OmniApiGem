require_relative 'user_resource'

module OmniApi
  module Resources
    class User
      class ClientAssociation < UserResource
        include OmniApi::Concerns::Timestamps

        attr_accessible :id, :client_url, :client_name, :token, :client_id
      end
    end
  end
end
