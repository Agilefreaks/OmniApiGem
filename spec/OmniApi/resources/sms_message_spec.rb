require 'spec_helper'

describe OmniApi::Resources::SmsMessage do
  describe '.schedule' do
    let(:message_details) { {phone_number: '1236', content: 'testC', send_at: DateTime.now } }
    subject { OmniApi::Resources::SmsMessage.schedule(message_details) }

    it { is_expected.to be_a(OmniApi::Resources::SmsMessage) }
    its(:state) { is_expected.to be :scheduled }
    its(:type) { is_expected.to be :outgoing }
    its(:phone_number) { is_expected.to eq '1236' }
    its(:content) { is_expected.to eq 'testC' }
    its(:send_at) { is_expected.to eq message_details[:send_at] }
  end
end