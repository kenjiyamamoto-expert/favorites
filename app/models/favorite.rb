class Favorite < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name,presence: true,length:{maximum: 20},uniqueness: true
  validates :url,presence: true,uniqueness: true
  validates :image,presence: true
  validates :text,length:{maximum: 140}
end
