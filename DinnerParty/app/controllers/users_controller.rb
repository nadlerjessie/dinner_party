class UsersController < ApplicationController
  
  def new
    @user = User.new 
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @dish_assignment = DishAssignment.all.first.id
  end

  def edit

  end

  def index
    @users = User.all
  end

  def dinner_params
    params.require(:dinner).permit(:date, :guests, :user_ids=>[])
  end
end
