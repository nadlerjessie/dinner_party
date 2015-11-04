class DinnersController < ApplicationController

  def new
    @dinner = Dinner.new
    @users = User.all
  end

  def create
    @dinner = Dinner.create(dinner_params)
    @user = User.find_by(id: session[:user_id])
    @host = Host.find_or_create_by(user_id: @user.id)
    @dinner.host = @host 
    @dinner.save
    @host.add_to_attendees(@dinner)
    redirect_to @dinner
  end

  def edit
    @dinner = Dinner.find(params[:id])
  end

  def update
    @dinner = Dinner.find(params[:id])
    @dinner.update(dinner_params)
    redirect_to @dinner
  end

  def index
    @dinners = Dinner.all
  end

  def show
    @dinner = Dinner.find(params[:id])
  end

  def destroy
    @dinner = Dinner.find(params[:id])
    @dinner.destroy 
  end

private

  def dinner_params
    params.require(:dinner).permit(:date, :title, :guests)
  end
end

