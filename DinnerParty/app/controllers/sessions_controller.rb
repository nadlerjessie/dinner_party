class SessionsController < ApplicationController

  def create
    @user = User.find_by_provider_and_uid(auth_hash)
    if @user
      session[:user_id] = @user.id
    else 
      @user = User.create_with_omniauth(auth_hash)
      session[:user_id] = @user.id
    end
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private 

  def auth_hash
    request.env["omniauth.auth"]
  end
end
