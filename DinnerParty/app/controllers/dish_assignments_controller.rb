class DishAssignmentsController < ApplicationController


  def new
    #all the available menu_items specific to that dinner 
    #redirects to index 
    @dinner = Dinner.find(params[:dinner_id])
    
    @menu_items = MenuItem.where(dinner_id: @dinner.id)
    
    @dish_assignment = DishAssignment.new

    main_dishes = MenuItem.joins(:dish).where(dinner_id: @dinner.id, dishes: {course: "Main Dish"})
    salads = MenuItem.joins(:dish).where(dinner_id: @dinner.id, dishes: {course: "Salad"})
    appetizers = MenuItem.joins(:dish).where(dinner_id: @dinner.id, dishes: {course: "Appetizer"})
    desserts = MenuItem.joins(:dish).where(dinner_id: @dinner.id, dishes: {course: "Dessert"})

    @menu_items_by_course = [main_dishes, salads, appetizers, desserts]

    @dishes_assigned = @dinner.taken_menu_items
  end

  def create
    @guest = Guest.find_by(user_id: current_user.id) 
    @assignments = params[:dish_assignment][:menu_item_ids]
    @assignments.each do |assignment|
      DishAssignment.create(guest_id: @guest.id, menu_item_id: assignment)
    end
    @user = current_user
    redirect_to @user
  end

  def index

  end

private 
  def find_dinner
    @dinner = Dinner.find(params[:dinner_id])
  end

  def dish_assignment_params
    params.permit(:dish_assigment).permit(:menu_item_ids=>[])
  end

end
