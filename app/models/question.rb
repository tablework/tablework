# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  answer            :string(255)
#  questionable_id   :integer
#  questionable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Question < ActiveRecord::Base
  belongs_to :questionable, :polymorphic => true
end
