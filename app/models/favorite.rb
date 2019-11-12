class Favorite < ApplicationRecord
  mount_uploader :image, ImageUploader
end
