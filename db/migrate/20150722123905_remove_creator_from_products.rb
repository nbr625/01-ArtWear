class RemoveCreatorFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :creator, :string
  end
end
