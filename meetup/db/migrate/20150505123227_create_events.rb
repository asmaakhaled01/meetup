class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.string :location
      t.datetime :date
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
