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
  def taken_menu_items
    menu_items.map {|menu_item| menu_item.id if menu_item.dish_assignment}.compact
  end

end
