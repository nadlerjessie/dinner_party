class DinnersController < ApplicationController

  def new
    @dinner = Dinner.new 
    @user = User.all  
  end

  def create
    @dinner = Dinner.new(dinner_params)
      if @dinner.save

      else

      end
  end

  def show 
    @dinner = Dinner.find(params[:id])
    binding.pry
  end

  def edit

  end

  def index
  end

  def dinner_params
    params.require(:dinner).permit(:date, :guests, :user_ids=>[])
  end
end

