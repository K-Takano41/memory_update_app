class CreateBadEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :bad_events do |t|
      t.text :body
      t.references :memory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
