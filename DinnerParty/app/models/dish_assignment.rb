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
end
