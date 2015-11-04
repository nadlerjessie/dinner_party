class MenuItemsController < ApplicationController
  before_action :set_dinner

  def new
    @menu_item = MenuItem.new
    @menu_ids = MenuItem.existing_menu_ids(@dinner.id) || []
    @all_dishes = Dish.find_available_dishes(@dinner.id, @menu_ids)
  end

  def create
    client = Adapters::MenuItemClient.new
    if params[:menu_item]
      params[:menu_item][:dish_ids].each do |dish_id|
        dish = Dish.find(dish_id)
        recipe_array = client.find_by_ingredient(dish)
        MenuItem.create(dish_id: dish_id, dinner_id: @dinner.id, recipe_title: recipe_array[0], recipe_url: recipe_array[-1])
      end
    end
    redirect_to dinner_menu_items_path
  end

  def index
    @all_dishes = MenuItem.index_by_course(@dinner.id)
  end

  def destroy
    menu_item = MenuItem.find(params[:id])
    menu_item.destroy
    redirect_to dinner_menu_items_path
  end


  private

  def set_dinner
    @dinner = Dinner.find(params[:dinner_id])
  end


end
