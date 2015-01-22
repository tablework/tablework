class SpaceMembershipsController < ApplicationController
  def new
    @space_membership = SpaceMembership.new
  end

  def create
    @space_membership = SpaceMembership.new(space_membership_params)
    @space_membership.space = Space.find(params[:space_id])
    if @space_membership.save
      SpaceMembershipMailer.send_invite(@space_membership).deliver
      flash[:notice] = 'Invitation sent'
      redirect_to @space_membership.space
    else
      render :new
    end
  end

  private

  def space_membership_params
    params.require(:space_membership).permit(
      :email
    )
  end
end
