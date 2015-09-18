require 'spec_helper'
require 'uri'

describe OmniApi::Resources::User::UserResource do
  describe '.site' do
    subject { OmniApi::Resources::User::UserResource.site }

    it { is_expected.to eq URI.parse("#{OmniApi.config.base_url}/user") }
  end
end