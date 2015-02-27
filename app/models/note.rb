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
#  link         :text
#  created_at   :datetime
#  updated_at   :datetime
#  link_html    :text
#  user_id      :integer
#

class Note < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  belongs_to :notable, polymorphic: true
  belongs_to :user

  before_save :clean_link_html

  def deletable?
    if self.notable.instance_of? Character
      true
    elsif self.notable.instance_of? Scene
      if self.notable.scenable.instance_of? Character
        return false
      else
        if self.notable.scenable.scenes.first ==  self.notable
          return false
        else
          return true
        end
      end
    end
  end

  private

  def clean_link_html
    self.link_html = nil if self.link_html == "<p><br></p>"
  end
end
