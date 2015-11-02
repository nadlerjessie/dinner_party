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
end
