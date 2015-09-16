require 'spec_helper'

describe OmniApi::Resources::Client do
  let(:instance ) { OmniApi::Resources::Client.new }

  describe :locale do
    subject { instance.locale }

    it { is_expected.to eq('ro') }
  end
end