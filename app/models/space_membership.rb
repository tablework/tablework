class SpaceMembership < ActiveRecord::Base
  belongs_to :space
  belongs_to :user

  before_validation :set_token

  validate :uniqueness_in_emails_for_space

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

  def uniqueness_in_emails_for_space
    if SpaceMembership.find_by(email: self.email, space_id: self.space_id).present?
      errors.add(:email, "User already invited") if self.new_record?
    end
  end
end
