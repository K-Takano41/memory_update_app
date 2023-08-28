class GoodEvent < ApplicationRecord
  MAX_EVENT_COUNT = 5
  belongs_to :memory

  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true, comparison: { less_than_or_equal_to: Proc.new{ Time.zone.now } }
  validate :events_count_limit
  private

  def events_count_limit
    if memory.good_events.count >= MAX_EVENT_COUNT
      errors.add :base, :events_count_limited
    end
  end
end
