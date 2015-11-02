class User < ActiveRecord::Base
  # as host
  has_many :hosted_dinners, foreign_key: "host_id", class_name: "Dinner"
  has_many :sent_invitations, class_name: "Invitee", through: :hosted_dinners
  has_many :guests, through: :sent_invitees

  # as guest
  has_many :invitees, foreign_key: "guest_id"
  has_many :dish_assignments, through: :invitees
  has_many :dinners, through: :invitees
  has_many :hosts, through: :dinners 
 
end


