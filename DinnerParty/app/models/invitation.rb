# == Schema Information
#
# Table name: invitations
#
#  id        :integer          not null, primary key
#  dinner_id :integer
#  guest_id  :integer
#  status    :string           default("pending")
#

class Invitation < ActiveRecord::Base
  belongs_to :dinner
  belongs_to :guest


  def user_ids
  end




end
