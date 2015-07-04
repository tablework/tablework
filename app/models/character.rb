# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  type_of_play :string
#  age          :integer
#  occupation   :string
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  nationality  :string
#  DOB          :datetime
#  space_id     :integer
#  gender       :string
#  image        :string
#

class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  before_validation { self.gender.downcase! if self.gender }
  has_many :scenes, as: :scenable
  has_many :scene_memberships, dependent: :destroy
  has_many :notes, as: :notable
  mount_uploader :image, ImageUploader

  validates :name, presence: true

  after_create :set_default_image

  def set_default_image
    return if image.present?
    image_path = "lib/images/default-avatar-#{1 + rand(5)}.png"
    self.image = File.open(image_path)
    self.save
  end
end
