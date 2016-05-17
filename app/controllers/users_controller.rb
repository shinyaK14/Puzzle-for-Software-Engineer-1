class UsersController < ApplicationController
  require 'socket'
  skip_before_action :verify_authenticity_token
  before_action :build_user, only: :create
  before_action :set_user, only: :update

  def index
    render json: { message: 'GET? No. No.' }, status: 200
  end

  def create
    if @user.save
      render json: { message: "#{create_complete_message}" }, status: 200
    else
      render json: { message: "Validation Error, #{@user.errors.first}" }, status: 400
    end
  end

  def token
    @user = User.find_by(token: params[:token])
    redirect_to root_path, alert: 'Your token is not valid' if @user.nil?
  end

  def update
    return if @user.nil?
    if verify_recaptcha(model: @user) && @user.update(user_params)
      redirect_to winners_path, notice: 'Thank you for your message!'
    else
      render :token
    end
  end

  private

  def user_params
    (params[:user] || params).permit(:name, :email, :comment)
  end

  def build_user
    @user = User.new(user_params)
  end

  def create_complete_message
    'Thanks! Please access to http://challenge-your-limits.herokuapp.com/challenge_users/token/' + @user.token + '  from your web browser.'
  end

  def set_user
    @user = User.find_by(token: params[:user][:token]) if token_present?
  end

  def token_present?
    params[:user].present? && params[:user][:token].present?
  end
end
