class DishAssignment < ActiveRecord::Base
  belongs_to :invitee
  belongs_to :menu_item
end