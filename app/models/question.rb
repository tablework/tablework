class Question < ActiveRecord::Base
  belongs_to :questionable, :polymorphic => true
end
