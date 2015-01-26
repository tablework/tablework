# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  notable_id   :integer
#  notable_type :string(255)
#  text         :text
#  image        :string(255)
#  link         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  link_html    :text
#

class Note < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :notable, polymorphic: true
end
