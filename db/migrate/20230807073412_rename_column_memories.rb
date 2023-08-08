class RenameColumnMemories < ActiveRecord::Migration[7.0]
  def change
    rename_column :memories, :page, :status
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
