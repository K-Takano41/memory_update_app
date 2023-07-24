class Prompt < ApplicationRecord
  validates :bad_prompt, presence: true
  validates :good_prompt, presence: true
  validates :question, presence: true
end
