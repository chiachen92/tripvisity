class SessionsController < ApplicationController
  def new

  end

  def create

    # @user = User.find_by_email params[:email]
    user = User.from_omniauth(env["omniauth.auth"])
    if user && env["omniauth.auth"].present?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Signed In'
    else
      flash.now[:alert] = 'Wrong credentials'
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

end


# user.authenticate(params[:password])
