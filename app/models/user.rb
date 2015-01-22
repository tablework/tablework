# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#  profile_photo          :string(255)
#  location               :string(255)
#  gender                 :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  occupation             :string(255)
#  skillset               :string(255)
#  eyecolor               :string(255)
#  DOB                    :date
#  mobile_phone           :string(255)
#  website                :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  image                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # validates :username, uniqueness: true
  validate :valid_gender
  before_validation { self.gender.downcase! if self.gender }
  mount_uploader :image, ImageUploader

  has_many :characters
  has_many :authorizations, dependent: :destroy
  has_many :owned_spaces, class: Space, foreign_key: 'director_id'
  has_many :space_memberships
  has_many :spaces, through: :space_memberships

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
