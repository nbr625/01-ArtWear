class AddPriceToSubproducts < ActiveRecord::Migration
  def change
    add_column :subproducts, :name, :string
    add_column :subproducts, :price, :decimal, precision: 12, scale: 3
  end
end
