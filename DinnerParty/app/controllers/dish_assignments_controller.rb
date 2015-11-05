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
      @guest.invitations.where(dinner_id: params[:dinner_id]).status = "Attending"
    end
    @user = current_user
    redirect_to @user
  end

  def index
    @menu_items_by_course = MenuItem.index_by_course(@dinner.id)
    @guest = Guest.find_by(user_id: current_user.id)
    @my_items = @guest.dish_assignments
    @dishes_assigned = @dinner.taken_menu_items
    @available_menu_items = MenuItem.find(@menu_items_by_course.flatten(1).map(&:id) - @dishes_assigned)
  end

  def destroy
    old_dish = DishAssignment.find(params[:id])
    old_dish.destroy
    
    @dish_assignment = DishAssignment.first
    redirect_to dinner_dish_assignments_path(@dinner)
  end
private 
  def find_dinner
    @dinner = Dinner.find(params[:dinner_id])
  end

  def dish_assignment_params
    params.permit(:dish_assigment).permit(:menu_item_ids=>[])
  end

end
