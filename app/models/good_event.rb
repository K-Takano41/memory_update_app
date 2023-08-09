class GoodEvent < ApplicationRecord
  MAX_EVENT_COUNT = 5
  belongs_to :memory

  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true, comparison: { less_than_or_equal_to: Proc.new{ Time.zone.now } }
  # validate :date_check
  # validate :events_count_limit, on: :create

  private

  # def events_count_limit
  #   if memory.good_events.count >= MAX_EVENT_COUNT
  #     errors.add :base, t('defaults.message.max_count')
  #   end
  # end
end
