# == Schema Information
#
# Table name: space_memberships
#
#  id         :integer          not null, primary key
#  space_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  email      :string
#  token      :string
#

class SpaceMembership < ActiveRecord::Base
  belongs_to :space
  belongs_to :user
  has_one :sm_invitation_notification

  before_validation :set_token

  validate :uniqueness_in_emails_for_space

  def send_invite
    SpaceMembershipMailer.send_invite(self).deliver_now
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
