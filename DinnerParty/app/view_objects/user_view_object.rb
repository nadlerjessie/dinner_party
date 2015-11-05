class UserViewObject
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def future_event?(invitation)
    #only display events where date > Time.now 
    invitation.dinner.date > Time.now
  end


end