class Link < ApplicationRecord
  belongs_to :user
  belongs_to :favorite, counter_cache: :links_count
end
