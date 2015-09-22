require 'spec_helper'
require 'active_resource/http_mock'

describe OmniApi::Resources::UserAuthorizationErrorHandler do
  let(:instance) { OmniApi::Resources::UserAuthorizationErrorHandler.new }

  describe '#handle' do
    let(:error) { Exception.new('some message') }
    let(:connection) { OmniApi::Resources::Connection.new('http://123.com') }
    let(:arguments) { [:get, 'http://123.com', {}] }

    subject { instance.handle(error, connection, arguments) }

    context 'the given error is not an ActiveResource::UnauthorizedAccess error' do
      it 'rethrows the given error' do
        expect { subject }.to raise_error(error)
      end
    end

    context 'the given error is an ActiveResource::UnauthorizedAccess error' do
      let(:error) { ActiveResource::UnauthorizedAccess.new('nah') }

      it 'tries to refresh the current user access token' do
        OmniApi.config.user_refresh_token = 'refreshToken'
        expect(OmniApi::Resources::Oauth2::Token).to receive(:refresh_for).with('refreshToken')

        subject rescue nil
      end

      describe 'refreshing the token works' do
        let(:updated_token) { OmniApi::Resources::Oauth2::Token.new({access_token: 'test'}) }

        before do
          allow(updated_token).to receive(:persisted?).and_return(true)
          allow(OmniApi::Resources::Oauth2::Token).to receive(:refresh_for).and_return(updated_token)
        end

        it 'tries to perform the original request again' do
          expect(connection).to receive(:request).with(*arguments)

          subject
        end

        context 'retrying the request is successful' do
          let(:response) { ActiveResource::Response.new(body: 'test1') }

          before { allow(connection).to receive(:request).and_return(response) }

          it { is_expected.to be response}
        end

        context 'retrying the request fails' do
          before { allow(connection).to receive(:request).and_raise(ActiveResource::BadRequest.new('test')) }

          it 'rethrows the error' do
            expect { subject }.to raise_error(ActiveResource::BadRequest)
          end

          context 'the request fails again with ActiveResource::UnauthorizedAccess' do
            before { allow(connection).to receive(:request).and_raise(ActiveResource::BadRequest.new('test')) }


          end
        end
      end
    end
  end
end