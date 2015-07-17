class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :subproduct, index: true
      t.references :order, index: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 3

      t.timestamps null: false
    end
    add_foreign_key :order_items, :subproducts
    add_foreign_key :order_items, :orders
  end
end
