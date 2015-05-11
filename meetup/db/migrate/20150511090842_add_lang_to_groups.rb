class AddLangToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :lang, :string
  end
end
