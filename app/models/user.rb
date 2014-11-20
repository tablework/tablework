class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true

  validate :valid_gender
  before_validation { self.gender.downcase! if self.gender }


  private

  def valid_gender
    unless self.gender == 'male' or self.gender == 'female'
      errors.add(:gender, "must be valid.")
    end
  end

  # def must_be_present
  #   unless self.total.present?
  #     errors.add(:total, "Cannot be empty.")
  #   end
  # end
end
