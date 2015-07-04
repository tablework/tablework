# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string
#  profile_photo          :string
#  location               :string
#  gender                 :string
#  provider               :string
#  uid                    :string
#  occupation             :string
#  skillset               :string
#  eyecolor               :string
#  DOB                    :date
#  mobile_phone           :string
#  website                :string
#  first_name             :string
#  last_name              :string
#  image                  :string
#  show_intro_1           :boolean          default("true")
#  show_intro_2           :boolean          default("false")
#  show_intro_3           :boolean          default("false")
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validate :valid_gender
  before_validation { self.gender.downcase! if self.gender }
  before_create :set_default_image
  mount_uploader :image, ImageUploader

  has_many :characters, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :authorizations, dependent: :destroy
  has_many :owned_spaces, class: Space, foreign_key: 'director_id', dependent: :destroy
  has_many :space_memberships, dependent: :destroy
  has_many :spaces, through: :space_memberships
  has_many :user_payments
  has_many :messages, dependent: :destroy

  after_create :set_sample_character
  after_create :set_sample_space

  #TC Wu's reimplementation
  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = sign_in_or_up_user(user, auth, current_user)
      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save
    end
    user.save
    user
  end

  private

  def self.sign_in_or_up_user(user, auth, current_user)
    user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
    if user.blank?
      user = User.new
      user.password = Devise.friendly_token[0,20]
      user = assign_user_variables(user, auth)
    else
      user = assign_user_variables(user, auth)
    end
    user
  end

  def set_sample_character
    self.characters.create(name: 'Sample Sam', description: 'This is a sample character. You can edit this description', type_of_play: 'movie', DOB: 30.years.ago, nationality: 'Malaysia', gender: 'Male')
  end

  def set_default_image
    image_path = "lib/images/default-avatar-#{1 + rand(5)}.png"
    self.image = File.open(image_path)
  end

  def set_sample_space
    self.owned_spaces.create(name: 'Sample Space', type_of_play: 'movie')
  end

  def self.assign_user_variables(user, auth)
    user.email = auth.info.email
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.gender = auth.extra.raw_info.gender
    user.profile_photo = auth.info.image
    user
  end

  def valid_gender
    unless self.gender == 'male' or self.gender == 'female' or self.gender == nil
      errors.add(:gender, "must be valid.")
    end
  end
end
