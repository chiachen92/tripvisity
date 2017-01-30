class SessionsController < ApplicationController

  def new

  end

    def create
      @user = User.find_by_email params[:email]
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully signed in!"
      else
        flash.now[:danger] = 'Wrong credentials'
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      flash[:notice] = "Signed out"
      redirect_to root_path
    end
  end
