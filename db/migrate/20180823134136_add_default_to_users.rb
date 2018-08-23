class AddDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :first_name, :string, :default => "Prénom"
    change_column :users, :last_name, :string, :default => "Nom"
  end
end
