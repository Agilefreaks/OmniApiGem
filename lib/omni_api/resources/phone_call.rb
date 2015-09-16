module OmniApi
  module Resources
    class PhoneCall < UserAuthorizedResource
      include OmniApi::Concerns::Timestamps

      attr_accessible :id, :number, :type, :state
    end
  end
end
