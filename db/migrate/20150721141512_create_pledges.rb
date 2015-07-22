class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.boolean :agreement
      t.references :user, index: true
      t.references :print, index: true

      t.timestamps null: false
    end
    add_foreign_key :pledges, :users
    add_foreign_key :pledges, :prints
  end
end
