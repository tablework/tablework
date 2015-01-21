class SpaceMembershipsController < ApplicationController
  def new
    @space_membership = SpaceMembership.new
  end

  def create
    @space_membership = SpaceMembership.new(space_membership_params)
    if @space_membership.save
      redirect_to :back
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
