class SessionsController < ApplicationController

  def new
      # renders the login form
    end

    def create
      @user = User.find_by_email params[:email]
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Signed In'
        redirect_to root_path
      else
        flash.now[:danger] = 'Wrong credentials'
        render :new

        # @user = user for that email exists and the password is correct
      end
    end

    def destroy
      session[:user_id] = nil
      flash[:success] = "Signed out"
      redirect_to root_path
    end
  end
