class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name,           null: false
      t.datetime :time,         null: false
      t.integer  :mid
      t.integer :rating
      t.string :comment,        limit: 500

    end
    add_reference :reviews, :movies, index:true
    add_foreign_key :reviews, :movies, column: :mid, on_delete: :cascade, on_update: :cascade

  end
end
