class AddFlagCountToPrint < ActiveRecord::Migration
  def change
    add_column :prints, :flag_count, :integer, default: 0
  end
end
