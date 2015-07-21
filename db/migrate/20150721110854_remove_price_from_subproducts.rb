class RemovePriceFromSubproducts < ActiveRecord::Migration
  def change
    remove_column :subproducts, :price, :integer
  end
end
