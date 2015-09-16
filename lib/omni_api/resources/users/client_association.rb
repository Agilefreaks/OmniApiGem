require_relative '../users/user_resource'

module OmniApi
  module Resources
    module Users
      class ClientAssociation < UserResource
        include OmniApi::Concerns::Timestamps

        attr_accessible :id, :client_url, :client_name, :token, :client_id
      end
    end
  end
end
