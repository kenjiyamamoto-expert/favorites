class Favorite < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name,presence: true,length:{maximum: 20}
  validates :url,presence: true
  validates :image,presence: true
  validates :text,length:{maximum: 140}

  belongs_to :user
end
