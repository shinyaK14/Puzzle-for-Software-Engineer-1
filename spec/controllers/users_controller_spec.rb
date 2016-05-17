require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe 'token' do
    it 'returns 200 when access to token' do
      get :token, token: user.token
      expect(response.status).to eq(200)
      expect(subject).to render_template(:token)
    end

    it 'redirects to root_path when token is invalid' do
      get :token, token: 'aaa'
      expect(response.status).to eq(302)
      expect(subject).to redirect_to(root_path)
    end
  end

  describe 'update' do
    it 'redirects to winners_path when update comment' do
      3.times { create :user, comment: 'aaa' }
      patch :update, user: { token: user.token, comment: 'abc' }
      expect(response.status).to eq(302)
      expect(assigns[:user].seq).to eq(User.where.not(comment: nil).count)
      expect(subject).to redirect_to(winners_path)
    end

    it 'renders token when user does not input comment' do
      patch :update, user: { token: user.token }
      expect(response.status).to eq(200)
      expect(subject).to render_template(:token)
    end
  end
end
