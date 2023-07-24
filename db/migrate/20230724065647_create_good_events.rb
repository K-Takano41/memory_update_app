class CreateGoodEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :good_events do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :date, null: false
      t.references :memory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
