class ChallengeController < ApplicationController
  def index
    @users = User.where.not(comment: nil).order('created_at DESC').limit(12)
    @count = User.where.not(comment: nil).count
  end

  def winners
    @users = User.where.not(comment: nil).order('created_at DESC').page(params[:page])
  end
end
