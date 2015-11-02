# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :dish_assignments
end
