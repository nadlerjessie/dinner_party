# == Schema Information
#
# Table name: dinners
#
#  id      :integer          not null, primary key
#  date    :datetime
#  host_id :integer
#  title   :string
#

class Dinner < ActiveRecord::Base
  belongs_to :host
  has_many :invitations, dependent: :destroy
  has_many :guests, through: :invitations
  has_many :menu_items, dependent: :destroy
  has_many :dish_assignments, through: :menu_items

  validates_presence_of :title

  # upon creation, invite self(host) and mark attending, create guest
  def taken_menu_items
    menu_items.map {|menu_item| menu_item.id if menu_item.dish_assignment}.compact
  end

  def formatted_date
    self.date.strftime("%B %d, %Y at %l:%M%p")
  end

  def assigned_dishes_for_guest(guest)
    dish_assignments_for_guest = DishAssignment.where(guest_id: guest.id)
    menu_item_ids = menu_items.map(&:id)

    dish_assignments_for_guest_for_dinner = dish_assignments_for_guest.select do |dish_assignment|
      menu_item_ids.include?(dish_assignment.menu_item_id)
    end

    dish_assignments_for_guest_for_dinner.map do |dish_assignment|
      dish_assignment.menu_item.dish.name
    end.join(", ")


  end

  def dish_assignments_for_guest(guest)
    
  end

  # dinner -> dish_assignments -> menu_items -> dish

end
