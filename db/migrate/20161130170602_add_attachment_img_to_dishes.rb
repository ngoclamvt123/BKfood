class AddAttachmentImgToDishes < ActiveRecord::Migration
  def self.up
    change_table :dishes do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :dishes, :img
  end
end
