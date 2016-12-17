class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :authorize
  
  def authorize
    redirect_to '/login' unless current_user
  end

  private
  def current_user
    @current_user = session[:user_id]
  end
end
