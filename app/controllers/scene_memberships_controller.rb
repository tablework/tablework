class SceneMembershipsController < ApplicationController
  def create
    @scene = Scene.find((params[:scene][:scene_id]))
    params[:scene][:characters].each do |character_id|
      next if !character_id.present? or @scene.scene_memberships.find_by(character_id: character_id).present?
      @scene.scene_memberships << @scene.scene_memberships.create!(character_id: character_id, membership_type: :normal, user_id: Character.find(character_id).user.id)
    end
    redirect_to @scene.scenable
  end

  def destroy
    @membership = SceneMembership.find(params[:id])
    @membership.destroy
    redirect_to @membership.scene.scenable
  end
end
