# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Host < ActiveRecord::Base
  belongs_to :user
  has_many :dinners
  has_many :invitations, through: :dinners
  has_many :guests, through: :invitations

  def name
    user.name
  end

  def add_to_attendees(dinner)
    @guest = Guest.find_or_create_by(user_id: self.user_id)
    @invitation = Invitation.new(dinner_id: dinner.id, guest_id: @guest.id, status: "Attending")
    @invitation.save
  end
end
