class AddCreatorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :creator, :string
  end
end
