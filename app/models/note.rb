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

  before_save :clean_link_html

  auto_html_for :link do
    html_escape
    image
    youtube(:width => 235, :height => 180, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  private

  def clean_link_html
    self.link_html = nil if self.link_html == "<p><br></p>"
  end
end
