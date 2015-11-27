class SessionsController < ApplicationController

  # def create
  #   @user = User.find_by_provider_and_uid(auth_hash)
  #   if @user
  #     session[:user_id] = @user.id
  #   else 
  #     @user = User.create_with_omniauth(auth_hash)
  #     session[:user_id] = @user.id
  #   end
  #   redirect_to @user
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid email or password"
      redirect_to new_session_path
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
    end
    redirect_to root_url
  end

  # def auth_hash
  #   request.env["omniauth.auth"]
  # end

end
