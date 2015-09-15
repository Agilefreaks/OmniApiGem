module OmniApi
  class AuthorizationCode < BaseClientModel
    include OmniApi::Concerns::Timestamps

    attr_accessible :id, :code
  end
end
