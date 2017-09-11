class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|
      t.string :last,           limit: 20
      t.string :first,          limit: 20
      t.datetime :dob,          null: false
      t.datetime :dod

    end
    add_index :directors, [:id], using: :btree

  end
end
