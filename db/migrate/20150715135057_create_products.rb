class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :creator
      t.text :description

      t.timestamps null: false
    end
  end
end
