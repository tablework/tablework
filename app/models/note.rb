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
#

class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true
end
