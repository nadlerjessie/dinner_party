class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
    @main_dishes = Dish.where(course: "Main Dish")
    @salads = Dish.where(course: "Salad")
    @appetizers = Dish.where(course: "Appetizer")
    @desserts = Dish.where(course: "Dessert")
    @dinner = Dinner.find(params[:dinner_id])
  end

  def create
    binding.pry
    if menu_items_params[:other]
      Dish.create(name: menu_items_params[:other], course: "user added")
    end

    dinner_id = params[:dinner_id]
    menu_items_params[:dish_ids].each do |dish_id|
      MenuItem.create(dish_id: dish_id, dinner_id: dinner_id)
    end
  end

  def index
    # @main_dishes = MenuItem.where(dinner_id: params[:dinner_id], dish.course: "Main Dish")
    # @salads = MenuItem.where(dinner_id: params[:dinner_id], dish.course: "Salad")
    # @appetizers = MenuItem.where(dinner_id: params[:dinner_id], dish.course: "Appetizer")
    # @desserts = MenuItem.where(dinner_id: params[:dinner_id], dish.course: "Dessert")
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
