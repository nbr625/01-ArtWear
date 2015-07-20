class AddPledgeToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :pledge, :boolean
  end
end
