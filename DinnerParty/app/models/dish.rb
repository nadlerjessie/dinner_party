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

  COURSES = ["Main Dish", "Salad", "Appetizer", "Dessert"]

  def self.find_available_dishes(dinner_id, menu_ids)
    COURSES.map do |course|
      Dish.select("dishes.*").where(course: course).where.not(id: menu_ids)
    end
  end
  
end
