class AddProductIdToSubproducts < ActiveRecord::Migration
  def change
    add_column :subproducts, :product_id, :integer
  end
end
