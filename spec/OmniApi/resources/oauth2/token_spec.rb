require 'spec_helper'

describe OmniApi::Resources::Oauth2::Token do
  describe '.collection_name' do
    subject { OmniApi::Resources::Oauth2::Token.collection_name }

    it { is_expected.to eq('token') }
  end

  def setup_successful_token_request
    body = {}
    headers = {'Content-Type' => 'application/json', 'Authorization' => 'bearer random'}
    ActiveResource::HttpMock.respond_to { |mock| mock.post '/api/v1/oauth2/token.json', headers, body.to_json, 200 }
  end

  describe '.create_for' do
    let(:email) { 'someUser@email.com' }

    subject { OmniApi::Resources::Oauth2::Token.create_for(email) }

    it 'tries to create a new access token for the user with the given email for the the current client using client credentials' do
      setup_successful_token_request

      subject

      expected_body = {
        'grant_type' => 'client_credentials',
        'client_id' => '',
        'client_secret' => '',
        'resource_type' => 'user',
        'resource_id' => 'someUser@email.com'
      }
      expect(ActiveResource::HttpMock.requests.first.body).to eq expected_body.to_json
    end

    context 'creating the token is successful' do
      before { setup_successful_token_request }

      it { is_expected.to be_a(OmniApi::Resources::Oauth2::Token) }
    end
  end

  describe '.refresh_for' do
    let(:refresh_token) { 'someRefreshToken' }

    subject { OmniApi::Resources::Oauth2::Token.refresh_for(refresh_token) }

    it 'tries to refresh the current user access token using the current user refresh token' do
      setup_successful_token_request

      subject

      expected_body = {
        'grant_type' => 'refresh_token',
        'client_id' => '',
        'refresh_token' => 'someRefreshToken',
        'resource_type' => 'user'
      }
      expect(ActiveResource::HttpMock.requests.first.body).to eq expected_body.to_json
    end

    context 'refreshing the token is successful' do
      before { setup_successful_token_request }

      it { is_expected.to be_a(OmniApi::Resources::Oauth2::Token) }
    end
  end
end