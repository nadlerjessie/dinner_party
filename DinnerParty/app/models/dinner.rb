# == Schema Information
#
# Table name: dinners
#
#  id      :integer          not null, primary key
#  date    :datetime
#  host_id :integer
#  title   :string
#

class Dinner < ActiveRecord::Base
  belongs_to :host
  has_many :invitations
  has_many :guests, through: :invitations
  has_many :menu_items
  has_many :dish_assignments, through: :menu_items

  # upon creation, invite self(host) and mark attending, create guest
  def user_ids=(user_ids)
  end

  def user_ids
  end

end
