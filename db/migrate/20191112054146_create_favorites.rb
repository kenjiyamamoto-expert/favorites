class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :url
      t.string :image
      t.text :text
      t.timestamps
    end
  end
end
