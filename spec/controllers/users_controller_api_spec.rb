require 'rails_helper'

RSpec.describe UsersController, type: :api do
  let(:user) { create :user }

  describe 'index' do
    it 'returns 200 when access to index' do
      get '/challenge_users'
      expect(last_response.status).to eq(200)
      expect(json['message']).to eq('GET? No. No.')
    end
  end

  describe 'create' do
    it 'returns 200 when create user' do
      post '/challenge_users', name: 'abc', email: 'abc@abc.com'
      expect(last_response.status).to eq(200)
      expect(User.find_by(name: 'abc').email).to eq('abc@abc.com')
      expect(json['message']).to start_with('Thanks! Please access to')
    end

    it 'returns 400 when fail to create user' do
      post '/challenge_users'
      expect(last_response.status).to eq(400)
      expect(json['message']).to start_with('Validation Error')
      expect(json['message']).to include('name')
    end

    it 'returns 400 when fail to create user' do
      post '/challenge_users', name: 'abc'
      expect(last_response.status).to eq(400)
      expect(json['message']).to start_with('Validation Error')
      expect(json['message']).to include('email')
    end
  end
end
