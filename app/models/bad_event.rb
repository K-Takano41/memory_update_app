class BadEvent < ApplicationRecord
  belongs_to :memory

  validates :body, presence: true

end
