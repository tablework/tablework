# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  title             :string
#  answer            :string
#  questionable_id   :integer
#  questionable_type :string
#  created_at        :datetime
#  updated_at        :datetime
#

class Question < ActiveRecord::Base
  belongs_to :questionable, :polymorphic => true
end
