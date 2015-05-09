class AddLonglatToEvent < ActiveRecord::Migration
  def change
    add_column :events, :long, :string
    add_column :events, :lat, :string
  end
end
