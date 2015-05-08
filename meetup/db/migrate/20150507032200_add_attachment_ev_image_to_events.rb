class AddAttachmentEvImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :ev_image
    end
  end

  def self.down
    remove_attachment :events, :ev_image
  end
end
