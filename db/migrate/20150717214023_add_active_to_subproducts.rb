class AddActiveToSubproducts < ActiveRecord::Migration
  def change
    add_column :subproducts, :active, :boolean
  end
end
