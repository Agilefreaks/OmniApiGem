module OmniApi
  module Resources
    class User < BaseClientModel
      include OmniApi::Concerns::Timestamps

      attr_accessible :first_name, :last_name, :plan

      def self.change_plan!(email, plan)
        put plan.to_s, [], {email: email}.to_json
      end
    end
  end
end
