class MenuItem < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dinner
  has_many :dish_assignments
end