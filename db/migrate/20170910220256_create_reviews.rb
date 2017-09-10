class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name,           null: false
      t.datetime :time,         null: false
      t.integer :movie_id
      t.integer :rating
      t.string :comment,        limit: 500
      t.references :Movie

      t.timestamps
    end
    add_foreign_key :reviews, :movies, on_delete: :cascade, on_update: :cascade

  end
end
