class RemoveInProductionFromPrints < ActiveRecord::Migration
  def change
    remove_column :prints, :in_production, :boolean
  end
end
