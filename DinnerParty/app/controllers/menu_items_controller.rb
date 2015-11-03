class MenuItemsController < ApplicationController
  before_action :set_dinner

  def new
    @menu_item = MenuItem.new
    @menu_ids = MenuItem.existing_menu_ids(@dinner.id) || []

    main_dishes = Dish.select("dishes.*").where(course: "Main Dish").where.not(id: @menu_ids)
    salads = Dish.select("dishes.*").where(course: "Salad").where.not(id: @menu_ids)
    appetizers = Dish.select("dishes.*").where(course: "Appetizer").where.not(id: @menu_ids)
    desserts = Dish.select("dishes.*").where(course: "Dessert").where.not(id: @menu_ids)

    @all_dishes = [main_dishes, salads, appetizers, desserts]
  end

  def create
    menu_items_params[:dish_ids].each do |dish_id|
      MenuItem.create(dish_id: dish_id, dinner_id: @dinner.id)
    end
    redirect_to dinner_menu_items_path
  end

  def index
    main_dishes = MenuItem.joins(:dish).where(dinner_id: params[:dinner_id], dishes: {course: "Main Dish"})
    salads = MenuItem.joins(:dish).where(dinner_id: params[:dinner_id], dishes: {course: "Salad"})
    appetizers = MenuItem.joins(:dish).where(dinner_id: params[:dinner_id], dishes: {course: "Appetizer"})
    desserts = MenuItem.joins(:dish).where(dinner_id: params[:dinner_id], dishes: {course: "Dessert"})
    @all_dishes = [main_dishes, salads, appetizers, desserts]
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

  def menu_items_params
    params.require(:menu_item)
  end

end
