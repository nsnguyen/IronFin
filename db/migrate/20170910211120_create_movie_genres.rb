class CreateMovieGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_genres, :id=>false do |t|
      t.integer :mid,    null: false
      t.string :genre,  limit: 20

    end
    add_index :movie_genres, [:mid], using: :btree
    # add_reference :movie_genres, :movies, index:true

    add_foreign_key :movie_genres, :movies ,column: :mid, on_delete: :cascade, on_update: :cascade
  end
end
