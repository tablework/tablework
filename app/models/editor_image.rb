class EditorImage < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
end
