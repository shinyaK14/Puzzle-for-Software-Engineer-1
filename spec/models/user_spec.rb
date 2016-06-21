require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  let(:user) { create :user }

  it 'is not valid when email is invalid format' do
    user.email = 'aaa'
    expect(user.valid?).to eq(false)
  end

  it 'has token when save' do
    expect(user.token).not_to eq(nil)
  end

  it 'replace irrelevant comment when update' do
    user.comment = '123 challenge_users 456'
    user.save
    expect(user.comment).not_to include('challenge_users')
  end
end
