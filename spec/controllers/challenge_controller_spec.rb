require 'rails_helper'

RSpec.describe ChallengeController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(assigns[:users]).to be_kind_of(Mongoid::Criteria)
      expect(assigns[:count]).not_to be_nil
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #winners' do
    it 'returns http success' do
      get :winners
      expect(assigns[:users]).to be_kind_of(Mongoid::Criteria)
      expect(response).to have_http_status(:success)
    end
  end
end
