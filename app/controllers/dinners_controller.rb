class DinnersController < ApplicationController

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.create(dinner_params)
    @user = User.find_by(id: session[:user_id])
    @host = Host.find_or_create_by(user_id: @user.id)
    @dinner.host = @host 
    if @dinner.save
      @host.add_to_attendees(@dinner)
      redirect_to @dinner
    else
      render "new"
    end
  end

  def edit
    @dinner = Dinner.find(params[:id])
  end

  def update
    @dinner = Dinner.find(params[:id])
    if @dinner.update(dinner_params)
      redirect_to @dinner
    else
      render "edit"
    end
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

    @user = current_user
    redirect_to @user
  end

private

  def dinner_params
    params.require(:dinner).permit(:date, :title)
  end
end

