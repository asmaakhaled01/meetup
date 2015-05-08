class AddAttachmentGImageToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :g_image
    end
  end

  def self.down
    remove_attachment :groups, :g_image
  end
end
