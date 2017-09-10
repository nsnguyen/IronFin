class CreateMovieGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_genres do |t|
      t.integer :mid,   null: false
      t.string :genre,  limit: 20
      t.references :movie, index: true

      t.timestamps
    end
    add_index :movie_genres, [:mid], using: :btree
    add_foreign_key :movie_genres, :movies , on_delete: :cascade, on_update: :cascade
  end
end
