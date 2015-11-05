class DishAssignmentViewObject
  def guest_bringing_dish(menu_item)
    "#{menu_item.name} -- #{menu_item.dish_assignment.guest.name}"
  end
end