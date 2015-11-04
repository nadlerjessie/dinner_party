# == Schema Information
#
# Table name: dish_assignments
#
#  id           :integer          not null, primary key
#  invitee_id   :integer
#  menu_item_id :integer
#



class DishAssignment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :menu_item

  def self.organize_by_availability(menu_items)
    menu_items
    DishAssignment.where(menu_item_id)
  end
end
