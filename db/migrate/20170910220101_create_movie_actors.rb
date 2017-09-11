class CreateMovieActors < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_actors, :id=>false do |t|
      t.integer :mid
      t.integer :aid
      t.string :role,       limit: 50

    end
    # add_reference :movie_actors, :movies#, index:true
    # add_reference :movie_actors, :actors#, index:true
    add_foreign_key :movie_actors, :movies, column: :mid, on_delete: :cascade, on_update: :cascade
    add_foreign_key :movie_actors, :actors, column: :aid, on_delete: :cascade, on_update: :cascade

  end
end
