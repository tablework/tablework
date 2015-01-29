# == Schema Information
#
# Table name: spaces
#
#  id           :integer          not null, primary key
#  name         :string
#  type_of_play :string
#  description  :string
#  director_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Space < ActiveRecord::Base
  has_many :characters
  has_many :scenes, as: :scenable, dependent: :destroy
  belongs_to :director, class: User
  has_many :space_memberships, dependent: :destroy
  has_many :users, through: :space_memberships
  after_create :setup_research


  private

  def setup_research
    research = self.scenes.create(title: 'Research')
    %w(Politic Economic Culture Fashion Geography Law).each do |title|
      research.notes.create(title: title)
    end
  end
end
