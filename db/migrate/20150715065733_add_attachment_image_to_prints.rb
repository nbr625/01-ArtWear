class AddAttachmentImageToPrints < ActiveRecord::Migration
  def self.up
    change_table :prints do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :prints, :image
  end
end
