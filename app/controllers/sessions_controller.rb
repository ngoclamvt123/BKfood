class SessionsController < ActionController::Base
  layout 'session'
  def new
    if session[:user_id]  == "user"
      redirect_to root_url
    end
  end

  def create
    if params[:email] == "admin@email.com" and params[:password] == "123456"
      session[:user_id] = "user"
      redirect_to root_url, :notice => "Logged in!"
    else
      flash[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged out!"
  end
end