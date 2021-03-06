class ChallengeController < ApplicationController
  def index
    @users = User.where(:comment.nin => ["", nil]).order('created_at DESC').limit(12)
    @count = User.where(:comment.nin => ["", nil]).count
  end

  def winners
    @users = User.where(:comment.nin => ["", nil]).order('created_at DESC').page(params[:page])
    @page = params[:page].nil? ? 0 : params[:page].to_i - 1
  end
end
