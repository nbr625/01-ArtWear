class AddPledgeCountToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :pledge_count, :integer
  end
end
