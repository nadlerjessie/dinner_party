class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
    @dishes = Dish.all
    @dinner = Dinner.find(params[:dinner_id])
  end

  def create
    if menu_items_params[:other]
      Dish.create(name: menu_items_params[:other], course: "user added")
    end

    dinner_id = params[:dinner_id]
    menu_items_params[:dish_ids].each do |dish_id|
      MenuItem.create(dish_id: dish_id, dinner_id: dinner_id)
    end
  end

  def index
    # @main_dishes = MenuItem.where(dinner_id = params[:dinner_id], course = "Main Dish")
    # @salads = MenuItem.where(dinner_id = params[:dinner_id], course = "Salad")
    # @appetizers = MenuItem.where(dinner_id = params[:dinner_id], course = "Appetizer")
    # @desserts = MenuItem.where(dinner_id = params[:dinner_id], course = "Dessert")
  end

  # def edit
  # end

  # def update
  # end

  def show
  end

  def destroy
  end


  private

  def menu_items_params
    params.require(:menu_item)
  end

end
