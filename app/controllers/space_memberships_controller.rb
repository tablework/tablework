class SpaceMembershipsController < ApplicationController
  def new
    @space_membership = SpaceMembership.new
  end

  def create
    @space_membership = SpaceMembership.new(space_membership_params)
    @space_membership.space = Space.find(params[:space_id])
    @space_membership_creator = SpaceMembershipCreator.new(@space_membership)
    if @space_membership_creator.call
      flash[:notice] = 'Invitation sent'
      redirect_to @space_membership.space
    else
      render :new
    end
  end

  def confirm
    @space_membership = SpaceMembership.find_by(token: params[:token])
    @space_membership.user = current_user
    @space_membership.email = current_user.email
    if @space_membership.save
      flash[:notice] = "You are invited to #{@space_membership.space.name}. Please create a character and assigned it to the space."
      redirect_to root_path
    else
      flash[:error] = @space_membership.errors.messages
      redirect_to root_path
    end
  end

  def destroy
    @membership = SpaceMembership.find(params[:id])
    @space = @membership.space
    @membership.destroy
    redirect_to @space, notice: 'User removed'
  end

  private

  def space_membership_params
    params.require(:space_membership).permit(
      :email
    )
  end
end
