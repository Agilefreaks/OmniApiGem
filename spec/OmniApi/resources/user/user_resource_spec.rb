require 'spec_helper'
require 'uri'

describe OmniApi::Resources::Users::UserResource do
  describe '.connection' do
    subject { OmniApi::Resources::Users::UserResource.connection }

    it { is_expected.to be_a(OmniApi::Resources::OmniApiConnection) }
  end

  describe '.site' do
    subject { OmniApi::Resources::Users::UserResource.site }

    it { is_expected.to eq URI.parse("#{OmniApi.config.base_url}/user") }
  end
end