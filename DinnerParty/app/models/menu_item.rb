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
  has_one :dish_assignment, dependent: :destroy

  Dish::COURSES

  def self.existing_menu_ids(dinner_id)
    existing_menu_items = self.where(dinner_id: dinner_id)
    if existing_menu_items
      menu_ids = existing_menu_items.map(&:dish).map(&:id)
    end
    menu_ids
  end

  def self.index_by_course(dinner_id)
    Dish::COURSES.map do |course| 
      self.joins(:dish).where(dinner_id: dinner_id, dishes: {course: course})
    end
  end

  def name
    dish.name
  end

end
