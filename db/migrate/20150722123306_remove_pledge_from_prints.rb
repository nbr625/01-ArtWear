rakclass RemovePledgeFromPrints < ActiveRecord::Migration
  def change
    remove_column :prints, :pledge, :integer
  end
end
