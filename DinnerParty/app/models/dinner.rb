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

  def check_guest_list_against_users
    users = User.all 
    dinner_guest_user_ids = self.guests.map{|guest| guest.user_id}
    users.reject{|user| dinner_guest_user_ids.include?(user.id)}
  end

  def assigned_dishes_for_guest(guest) 
    guest_dish_assignments = dish_assignments.where(guest_id: guest.id)
    guest_dish_assignments.map do |dish_assignment|
      dish_assignment.menu_item.name
    end.join(", ")   
  end

end
