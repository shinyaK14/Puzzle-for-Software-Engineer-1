class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActionView::MissingTemplate, with: :not_this_way
  rescue_from ActionController::RoutingError, with: :not_this_way
  rescue_from ActionController::ParameterMissing, with: :params_missing

  def not_this_way
    render json: { message: 'No No. Not this way' }, status: 404
  end

  def params_missing
    render json: { message: 'ParameterMissing (param is missing or the value is empty)' }, status: 404
  end
end
