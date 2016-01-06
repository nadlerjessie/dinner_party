class UserViewObject
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def future_event?(dinner)
    dinner.date > Time.now
  end

  def formatted_date(dinner)
    dinner.date.strftime("%B %d, %Y at %l:%M%p")
  end

  def find_recipes(invitation)
    return_array = []
    guest_dish_assignments = invitation.dinner.dish_assignments.where(guest_id: user.guest.id)
    guest_dish_assignments.map do |dish_assignment|
      return_array << [dish_assignment.menu_item.recipe_title, dish_assignment.menu_item.recipe_url]
    end
    return_array
  end

  def host(invitation)
    if invitation.host.user_id == @user.id
      "You"
    else
      invitation.host.name
    end
  end


end