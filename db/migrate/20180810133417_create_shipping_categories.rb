class CreateShippingCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_categories do |t|
      t.string :name, null: false
      t.string :alpha2, null: false
      t.integer :weight, null: false
      t.timestamps
    end

    add_monetize :shipping_categories, :price, currency: { present: false }
  end
end
