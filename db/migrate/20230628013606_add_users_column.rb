class AddUsersColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, null: false
      t.integer :role, null: false, default: 0
    end
  end
end
