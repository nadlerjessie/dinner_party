# == Schema Information
#
# Table name: dishes
#
#  id     :integer          not null, primary key
#  name   :string
#  course :string



class Dish < ActiveRecord::Base
  has_many :menu_items
  has_many :dish_assignments, through: :menu_items
end
