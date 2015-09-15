require 'spec_helper'

describe OmniApi::UserAuthorizedResource do
  describe '.headers' do
    subject { OmniApi::UserAuthorizedResource.headers }

    context 'the OmniApi config contains a user access token' do
      before { OmniApi.config.user = 'someToken' }

      its(['Authorization']) { is_expected.to eq('bearer someToken') }
    end

    context 'the OmniApi config does not contain a user access token' do
      before { OmniApi.config.user = nil }

      its(['Authorization']) { is_expected.to eq('bearer ') }
    end
  end

  describe '.connection' do
    subject { OmniApi::UserAuthorizedResource.connection }

    it { is_expected.to be_a(OmniApi::OmniApiConnection) }
  end
end
