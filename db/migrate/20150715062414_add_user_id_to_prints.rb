class AddUserIdToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :user_id, :integer
  end
end
