class AddMissingFields < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :adress, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string, null: false, default: "FR"
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_picture_url, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
    add_column :users, :tracking, :string
    add_reference :ceramiques, :offer, foreign_key: true
    change_column :ceramiques, :description, :text
    add_column :ceramiques, :weight, :integer
    add_column :orders, :take_away, :boolean
    add_monetize :orders, :port, currency: { present: false }
    add_column :orders, :weight, :integer
    add_column :orders, :promo, :string
    add_reference :orders, :promo, foreign_key: true
    remove_column :orders, :promo
    add_column :orders, :method, :string
    Order.update_all(take_away: false)
    change_column_null :ceramiques, :name, true
    change_column_null :ceramiques, :description, true
    change_column_null :categories, :name, true
    change_column_null :articles, :content, true
    add_column :basketlines, :ceramique_name, :string
    add_column :basketlines, :ceramique_qty, :int
    add_monetize :basketlines, :basketline_price, currency: { present: false }
    add_column :ceramiques, :position, :integer
  end
end
