# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  name     :string
#  uid      :string
#  provider :string
#

class User < ActiveRecord::Base
  
  has_many :guests
  has_many :hosts

def self.create_with_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["name"]
    end
  end

  def self.find_by_provider_and_uid(auth_hash)
    User.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])
  end
    
end


