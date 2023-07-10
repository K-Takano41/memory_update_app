class BadEvent < ApplicationRecord
  belongs_to :memory

  validates :body, presence: true, length: {minimum:3}
end
