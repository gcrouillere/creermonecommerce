class AddUserToTables < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :calendarupdates, :user, foreign_key: true
    add_reference :categories, :user, foreign_key: true
    add_reference :ceramiques, :user, foreign_key: true
  end
end
