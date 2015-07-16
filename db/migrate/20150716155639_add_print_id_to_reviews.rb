class AddPrintIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :print_id, :integer
  end
end
