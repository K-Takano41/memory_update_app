class AddColumnPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :bad_negative_prompt, :text
    add_column :prompts, :good_negative_prompt, :text
  end
end
