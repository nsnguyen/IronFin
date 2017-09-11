class CreateMovieDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_directors, :id=>false do |t|
      t.integer :mid
      t.integer :did

    end
    # add_reference :movie_directors, :movies, index:true
    # add_reference :movie_directors, :directors, index:true
    add_foreign_key :movie_directors, :movies, column: :mid, on_delete: :cascade, on_update: :cascade
    add_foreign_key :movie_directors, :directors, column: :did, on_delete: :cascade, on_update: :cascade

  end
end
