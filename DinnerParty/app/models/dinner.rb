class Dinner < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  has_many :sent_invitations, class_name: "Invitee"
  has_many :guests, through: :sent_invitations
  has_many :menu_items
  has_many :dish_assignments, through: :menu_items

  # upon creation, invite self(host) and mark attending, create guest
end