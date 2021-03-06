class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: false
      t.timestamps
    end
  end
end
