class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :director, null: false
      t.integer :release_year, null: false
      t.string :description, null: false
      t.string :genre, null: false
      t.float :rating
      t.integer :reviews_count, null: false, default: 0
      t.string :image_url

      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :director
  end
end
