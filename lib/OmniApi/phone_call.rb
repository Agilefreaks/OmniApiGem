module OmniApi
  class PhoneCall < UserAuthorizedResource
    include OmniApi::Concerns::Timestamps

    attr_accessible :id, :number, :type, :state
  end
end
