class CreateSubproducts < ActiveRecord::Migration
  def change
    create_table :subproducts do |t|
      t.integer :price
      t.integer :quantity
      t.string :size

      t.timestamps null: false
    end
  end
end
