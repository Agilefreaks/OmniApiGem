require 'spec_helper'

describe OmniApi::Resources::User do
  it { should respond_to :first_name }
  it { should respond_to :last_name }

  describe :element_path do
    subject { OmniApi::Resources::User.element_path('1') }

    it { should == '/api/v1/users/1.json' }
  end

  describe :change_plan! do
    let(:plan) { '' }
    subject { OmniApi::Resources::User.change_plan!('email@domain.com', plan) }

    context 'to premium' do
      let(:plan) { OmniApi::Resources::PaymentPlan::PREMIUM }

      before do
        ActiveResource::HttpMock.respond_to do |mock|
          mock.put '/api/v1/users/premium.json', {'Content-Type' => 'application/json', 'Authorization' => 'bearer random'}, 'email' => 'email@domain.com'
        end
      end

      it('makes the api call to make the user a premium user') { should.nil? }
    end

    context 'to_basic' do
      let(:plan) { :basic }
      before do
        ActiveResource::HttpMock.respond_to do |mock|
          mock.put '/api/v1/users/basic.json', {'Content-Type' => 'application/json', 'Authorization' => 'bearer random'}, 'email' => 'email@domain.com'
        end
      end

      it('makes the api call to make the user a basic user') { should.nil? }
    end
  end
end
