class Memory < ApplicationRecord
  belongs_to :user
  has_many :bad_events, dependent: :destroy
  has_many :good_events, dependent: :destroy
end
