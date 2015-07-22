class AddPrintIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :print_id, :integer
  end
end
