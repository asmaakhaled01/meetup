class AddMembersNameToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :MembersName, :string
  end
end
