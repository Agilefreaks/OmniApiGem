module OmniApi
  module Resources
    class SmsMessage < BaseClientModel
      include OmniApi::Concerns::Timestamps

      attr_accessible :phone_number, :content, :type, :state, :send_at

      def self.schedule(options)
        sms_message = OmniApi::SmsMessage.new(options)
        sms_message.state = :scheduled
        sms_message.type = :outgoing

        sms_message
      end
    end
  end
end
