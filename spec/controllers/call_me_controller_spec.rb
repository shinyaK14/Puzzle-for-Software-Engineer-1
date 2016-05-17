require 'rails_helper'

RSpec.describe CallMeController, type: :api do
  describe 'GET' do
    it 'returns 200 when access to index' do
      get '/call/me'
      expect(last_response.status).to eq(200)
      expect(json['message']).to start_with("Almost! It's not GET")
    end

    it 'returns 200 when access to callme' do
      get '/me'
      expect(last_response.status).to eq(200)
      expect(json['message']).to start_with('Maybe you are right')
    end
  end

  describe 'POST' do
    it 'returns 200 when access to create' do
      post '/call/me'
      expect(last_response.status).to eq(200)
      expect(json['message']).to start_with('Great! Please register')
    end
  end
end
