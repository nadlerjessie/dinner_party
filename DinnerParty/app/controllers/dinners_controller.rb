class DinnersController < ApplicationController

  def new
    @dinner = Dinner.new 
    @user = User.all  
  end

  def index
  end

  def create
    raise
  end

  def show 
  end

  def dinner_params
    params.require(:dinner).permit(:date, :guests, :user_ids=>[])
  end
end
