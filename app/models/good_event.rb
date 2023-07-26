class GoodEvent < ApplicationRecord
  MAX_EVENT_COUNT = 5
  belongs_to :memory

  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validate :date_check
  validate :events_count_limit

  private

  def date_check
    if date > Time.zone.now
      errors.add :date, "過去の日付を入力してください"
    end
  end

  def events_count_limit
    if memory.good_events.count >= MAX_EVENT_COUNT
      errors.add :base, "これ以上は登録できません"
    end
  end
end
