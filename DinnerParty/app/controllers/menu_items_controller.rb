class MenuItemsController < ApplicationController
  before_action :set_dinner

  def new
    @menu_item = MenuItem.new
    @menu_ids = MenuItem.existing_menu_ids(@dinner.id) || []
    @all_dishes = Dish.find_available_dishes(@dinner.id, @menu_ids)
  end

  def create
    if params[:menu_item]
      params[:menu_item][:dish_ids].each do |dish_id|
        MenuItem.create(dish_id: dish_id, dinner_id: @dinner.id)
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
