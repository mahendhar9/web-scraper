class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :hotness
      t.string :image_url
      t.text :synopsis
      t.string :rating
      t.string :genre
      t.string :director
      t.string :runtime
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
