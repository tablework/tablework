class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :username, uniqueness: true

  validate :valid_gender
  before_validation { self.gender.downcase! if self.gender }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]    
      user.first_name = auth.info.first_name   
      user.last_name = auth.info.last_name
      user.gender = auth.extra.raw_info.gender
      user.profile_photo = auth.info.image # assuming the user model has an image
    end
  end

  private

  def valid_gender
    unless self.gender == 'male' or self.gender == 'female' or self.gender == nil
      errors.add(:gender, "must be valid.")
    end
  end

  # def must_be_present
  #   unless self.total.present?
  #     errors.add(:total, "Cannot be empty.")
  #   end
  # end
end
