class AddUsersColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :role, :integer, null:false, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- :null => false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
