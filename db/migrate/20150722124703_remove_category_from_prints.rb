class RemoveCategoryFromPrints < ActiveRecord::Migration
  def change
    remove_column :prints, :category, :string
  end
end
