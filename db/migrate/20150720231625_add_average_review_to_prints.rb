class AddAverageReviewToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :average_review, :integer
  end
end
