class CreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts do |t|
      t.text :bad_prompt, null: false
      t.text :good_prompt, null: false

      t.timestamps
    end
  end
end
