class CreateMovieActors < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_actors do |t|
      t.integer :movie_id
      t.integer :actor_id
      t.string :role,       limit: 50
      t.references :movies
      t.references :actors

      t.timestamps
    end
    add_foreign_key :movie_actors, :movies, on_delete: :cascade, on_update: :cascade
    add_foreign_key :movie_actors, :actors, on_delete: :cascade, on_update: :cascade

  end
end
