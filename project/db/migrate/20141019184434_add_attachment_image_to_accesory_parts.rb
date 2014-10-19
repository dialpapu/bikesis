class AddAttachmentImageToAccesoryParts < ActiveRecord::Migration
  def self.up
    change_table :accesory_parts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :accesory_parts, :image
  end
end
