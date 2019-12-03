class Favorite < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name,presence: true,length:{maximum: 20}
  validates :url,presence: true
  validates :image,presence: true
  validates :text,length:{maximum: 140}
  validates :category_id,presence: true

  belongs_to :user
  has_many :links, dependent: :destroy

  def link_user(user_id)
   links.find_by(user_id: user_id)
  end

  def self.search(search)
    return Favorite.all unless search
    Favorite.where(['name LIKE ?', "%#{search}%"])
  end
end
