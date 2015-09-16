require_relative 'user_resource'

module OmniApi
  module Resources
    class User
      class Device < UserResource
        include OmniApi::Concerns::Timestamps

        attr_accessible :id, :name, :registration_id
      end
    end
  end
end
