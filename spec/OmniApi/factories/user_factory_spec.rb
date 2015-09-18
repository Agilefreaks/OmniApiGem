require 'spec_helper'

describe OmniApi::Factories::UserFactory do
  describe '.ensure_user_exists' do
    let(:user_info) { double('info', email: 'test@email.com', first_name: 'first', last_name: 'last', image: 'test')}
    let(:auth) { double('auth', info: user_info) }

    subject { OmniApi::Factories::UserFactory.ensure_user_exists(auth) }

    context 'a user with the given email exists' do
      let(:user) { OmniApi::Resources::User.new({email: 'test@email.com', first_name: 'first', last_name: 'last', image_url: 'test'}) }

      before do
        path = "/api/v1/users.json?email=#{ERB::Util.url_encode(user_info.email)}"
        ActiveResource::HttpMock.respond_to do |mock|
          mock.get path, {'Accept' => 'application/json', 'Authorization' => 'bearer random'}, [user].to_json
        end
      end

      it { is_expected.to eq user }
    end

    context 'a user with the given email does not exist' do
      before do
        path = "/api/v1/users.json?email=#{ERB::Util.url_encode(user_info.email)}"
        ActiveResource::HttpMock.respond_to do |mock|
          mock.get path, {'Accept' => 'application/json', 'Authorization' => 'bearer random'}, [].to_json
        end
      end

      it 'tries to create a user with the given info' do
        expected_data = {email: 'test@email.com', first_name: 'first', last_name: 'last', image_url: 'test'}
        expect(OmniApi::Resources::User).to receive(:create).with(expected_data)

        subject
      end
    end
  end
end