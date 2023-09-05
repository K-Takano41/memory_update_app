class ChangeMemoriesBadImageNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memories, :bad_image, false
  end
end
