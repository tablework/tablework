class SpaceMembership < ActiveRecord::Base
  belongs_to :space
  belongs_to :user

  before_validation :set_token

  validates :email, uniqueness: true

  def send_invite
    SpaceMembershipMailer.send_invite(self).deliver
  end

  private

  def set_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless SpaceMembership.find_by(token: random_token).present?
    end
  end
end
