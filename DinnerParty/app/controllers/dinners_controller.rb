class DinnersController < ApplicationController

  def new
    @dinner = Dinner.new
    @users = User.all
  end

  def create
    @dinner = Dinner.create(dinner_params)
    @user = User.find_by(id: session[:user_id])
    @host = Host.find_or_create_by(user_id: @user.id)
    @dinner.host_id = @host.id
    @dinner.save
    #need to invite self to party and mark as attending. 
    redirect_to @dinner
  end

  def show
    @dinner = Dinner.find(params[:id])
  end

  def destroy
    @dinner = Dinner.find(params[:id])
    @dinner.destroy 
  end


  def dinner_params
    params.require(:dinner).permit(:date, :guests, :user_ids=>[])
  end
end
