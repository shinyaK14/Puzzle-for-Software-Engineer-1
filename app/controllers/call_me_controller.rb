class CallMeController < ApplicationController
  def index
    render json: { message: "Almost! It's not GET. Keep trying." }
  end

  def create
    render json: { message: 'Great! Please register as /challenge_users' }
  end

  def callme
    render json: { message: "Maybe you are right. But can you just 'call/me'?" }
  end
end
