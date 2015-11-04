class DishAssignmentsController < ApplicationController
  before_action :find_dinner

  def new
    @dinner = Dinner.find(params[:dinner_id])
    @dish_assignment = DishAssignment.new
    @menu_items_by_course = MenuItem.index_by_course(@dinner.id)
    @dishes_assigned = @dinner.taken_menu_items
  end

  def create
    @guest = Guest.find_by(user_id: current_user.id) 
    @assignments = params[:dish_assignment][:menu_item_ids]
    @assignments.each do |assignment|
      DishAssignment.create(guest_id: @guest.id, menu_item_id: assignment)
    end
    redirect_to @user
  end

  def edit
    @menu_items_by_course = MenuItem.index_by_course(@dinner.id)
    @guest = Guest.find_by(user_id: current_user.id)
    @my_items = @guest.dish_assignments#.map(&:menu_item)
    @dish_assignment = @my_items.first
    @dishes_assigned = @dinner.taken_menu_items
    @available_menu_items = MenuItem.find(@menu_items_by_course.flatten(1).map(&:id) - @dishes_assigned)
  end

  def update
    guest = Guest.find_by(user_id: current_user.id)
    @dish_assignment = DishAssignment.first
    @new_items = MenuItem.find(params[:dish_assignment][:menu_item_ids])
    @new_items.each do |new_item|
      dish_assignment = new_item.build_dish_assignment(guest_id: guest.id)
      dish_assignment.save
    end
    redirect_to edit_dinner_dish_assignment_path(@dinner, @dish_assignment)
  end

  def destroy
    old_dish = DishAssignment.find(params[:id])
    old_dish.destroy
    
    @dish_assignment = DishAssignment.first
    redirect_to edit_dinner_dish_assignment_path(@dinner, @dish_assignment)
  end
private 
  def find_dinner
    @dinner = Dinner.find(params[:dinner_id])
  end

  def dish_assignment_params
    params.permit(:dish_assigment).permit(:menu_item_ids=>[])
  end

end
