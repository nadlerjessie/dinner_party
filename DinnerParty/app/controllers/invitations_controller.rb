class InvitationsController < ApplicationController
 
  def new
    @invitation = Invitation.new
    @dinner = Dinner.find(params[:dinner_id])
  end

  def create
    @dinner = Dinner.find(params[:dinner_id])
    invitation_params[:user_ids].each do |user_id|
      if !user_id.empty?
        @guest = Guest.find_or_create_by(user_id: user_id)
        @dinner.invitations.build(guest_id: @guest.id)
      end
    end
    @dinner.save
    redirect_to @dinner
  end

  def index
    @dinner = Dinner.find(params[:dinner_id])
  end

  def destroy
    @dinner = Dinner.find(params[:dinner_id])
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to dinner_invitation_path(@dinner)
  end

private

  def invitation_params
    params.require(:invitation).permit(:user_ids=>[])
  end


end
