require 'spec_helper'

describe OmniApi::Resources::UserAuthorizedResource do
  describe '.headers' do
    subject { OmniApi::Resources::UserAuthorizedResource.headers }

    context 'the OmniApi config contains a user access token' do
      before { OmniApi.config.user_access_token = 'someToken' }

      its(['Authorization']) { is_expected.to eq('bearer someToken') }
    end

    context 'the OmniApi config does not contain a user access token' do
      before { OmniApi.config.user_access_token = nil }

      its(['Authorization']) { is_expected.to eq('bearer ') }
    end
  end

  describe '.connection' do
    subject { OmniApi::Resources::UserAuthorizedResource.connection }

    it { is_expected.to be_a(OmniApi::Resources::Connection) }

    its(:error_handler) { is_expected.to be_a(OmniApi::Resources::UserAuthorizationErrorHandler) }
  end
end
