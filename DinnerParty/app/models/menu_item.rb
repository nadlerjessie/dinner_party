# == Schema Information
#
# Table name: menu_items
#
#  id        :integer          not null, primary key
#  dish_id   :integer
#  dinner_id :integer
#

class MenuItem < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dinner
  has_many :dish_assignments
end
