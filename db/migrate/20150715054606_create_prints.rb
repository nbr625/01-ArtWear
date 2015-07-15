class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.string :name
      t.text :description
      t.integer :pledge
      t.integer :rating
      t.string :category

      t.timestamps null: false
    end
  end
end
