class AddNumcountToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :links_count, :integer
  end
end
