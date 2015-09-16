module OmniApi
  module Resources
    class BaseModel < ActiveResource::Base
      include Concerns::Attributes

      def as_json(_options = nil)
        attributes
      end
    end
  end
end
