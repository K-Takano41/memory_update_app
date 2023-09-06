class AddColumnPrompts < ActiveRecord::Migration[7.0]
  def change
    change_table :prompts, bulk: true do |t|
      t.text :bad_negative_prompt
      t.text :good_negative_prompt
    end
  end
end
