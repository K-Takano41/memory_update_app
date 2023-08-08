class GoodEvent < ApplicationRecord
  MAX_EVENT_COUNT = 5
  belongs_to :memory

  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validate :date_check
  validate :events_count_limit, on: :create

  private

  def date_check
    if date > Time.zone.now
      errors.add :date, t('defaults.message.date_error')
    end
  end

  def events_count_limit
    if memory.good_events.count >= MAX_EVENT_COUNT
      errors.add :base, t('defaults.message.max_count')
    end
  end
end
