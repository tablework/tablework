# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  user_id    :integer
#  token      :string
#  secret     :string
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

class Authorization < ActiveRecord::Base
  belongs_to :user

  after_create :fetch_details

  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}")
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(self.token)
    facebook_data = graph.get_object("me")
    self.username = facebook_data['username']
    self.save
  end
end
