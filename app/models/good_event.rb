class GoodEvent < ApplicationRecord
  belongs_to :memory

  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
end
