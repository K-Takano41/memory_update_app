class Memory < ApplicationRecord
  belongs_to :user
  has_one :bad_event, dependent: :destroy
  has_many :good_events, dependent: :destroy

  enum page: { bad: 0, good: 1 }

end
