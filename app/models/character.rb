class Character < ActiveRecord::Base
  belongs_to :user
  # has_many :questions, :as => :questionable
end
