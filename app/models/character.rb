# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  type_of_play :string(255)
#  age          :integer
#  occupation   :string(255)
#  fields       :hstore           default("")
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  nationality  :string(255)
#  DOB          :datetime
#  space_id     :integer
#  gender       :string(255)
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
    image_path = "lib/images/default-avatar-#{1 + rand(5)}.png"
    self.image = File.open(image_path)
    self.save
  end
end
