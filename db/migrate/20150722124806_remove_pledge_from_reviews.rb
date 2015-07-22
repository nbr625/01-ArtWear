class RemovePledgeFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :pledge, :boolean
  end
end
