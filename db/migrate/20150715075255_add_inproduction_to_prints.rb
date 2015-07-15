class AddInproductionToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :in_production, :boolean
  end
end
