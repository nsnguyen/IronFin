class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.integer :movie_id,      null: false
      t.string :title,          null: false, limit: 100
      t.integer :year
      t.string :rating,         limit: 10
      t.string :company,        limit: 50

      t.timestamps
    end
    add_index :movies, [:id, :title], using: :btree
  end
end
