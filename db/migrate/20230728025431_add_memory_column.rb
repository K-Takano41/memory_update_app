class AddMemoryColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :memories, :page, :integer, null: false, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
