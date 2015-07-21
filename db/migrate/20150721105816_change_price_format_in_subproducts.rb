class ChangePriceFormatInSubproducts < ActiveRecord::Migration
  def change
  	def up 
  		change_column :subproducts, :price, :decimal, precision: 12, scale: 3
  	end

  	def down
  		change_column :subproducts, :price, :integer
  	end
  end
end
