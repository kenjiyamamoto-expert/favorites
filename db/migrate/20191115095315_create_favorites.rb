class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name,   null: false, unique: true
      t.string :url,   null: false, unique: true
      t.string :image, null: false
      t.text :text
      t.timestamps
    end
  end
end
