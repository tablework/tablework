class SpaceMembership < ActiveRecord::Base
  belongs_to :space
  belongs_to :user
end
