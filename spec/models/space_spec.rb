# == Schema Information
#
# Table name: spaces
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  type_of_play :string(255)
#  description  :string(255)
#  director_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Space, :type => :model do
  subject(:space) { build :space }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :type_of_play }
  it { is_expected.to respond_to :director }
  it { is_expected.to respond_to :description }

  describe 'associations' do
    before do
      space.save
    end

    it "has many characters" do
      character_1 = create :character
      character_2 = create :character
      space.characters << character_1
      space.characters << character_2
      expect(space.characters.to_a).to eql [character_2, character_1]
    end

    it "has many scenes" do
      scene_1 = create :scene
      scene_2 = create :scene
      space.scenes << scene_1
      space.scenes << scene_2
      expect(space.scenes.to_a).to eql [scene_2, scene_1]
    end

    it "has one director" do
      user = create :user
      space.director = user
      space.save
      expect(space.director).to eql user
    end

    it "has many space_memberships" do
      space_membership = create :space_membership
      space.space_memberships << space_membership
      expect(space.space_memberships.to_a).to eql [space_membership]
    end

    it "has many users through space space_memberships" do
      user_1 = create :user
      space_membership_1 = create :space_membership, user: user_1, space: space
      user_2 = create :user
      space_membership_2 = create :space_membership, user: user_2, space: space
      expect(space.users.to_a).to eql [user_1, user_2]
    end
  end
end
