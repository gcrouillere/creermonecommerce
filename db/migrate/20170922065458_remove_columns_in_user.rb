class RemoveColumnsInUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :adress
    remove_column :users, :zip_code
    remove_column :users, :city
  end
end
