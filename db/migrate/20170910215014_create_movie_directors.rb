class CreateMovieDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_directors do |t|
      t.integer :movie_id
      t.integer :director_id
      t.references :movies
      t.references :directors

      t.timestamps
    end
    add_foreign_key :movie_directors, :movies, on_delete: :cascade, on_update: :cascade
    add_foreign_key :movie_directors, :directors, on_delete: :cascade, on_update: :cascade

  end
end
