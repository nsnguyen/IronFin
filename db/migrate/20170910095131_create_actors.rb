class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.integer :actor_id,      null: false
      t.string :last,           limit: 20
      t.string :first,          limit: 20
      t.string :sex,            limit:6
      t.datetime :dob,          null: false
      t.datetime :dod

      t.timestamps
    end
    add_index :actors, [:id], using: :btree

  end
end
