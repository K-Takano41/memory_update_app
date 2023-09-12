class Memory < ApplicationRecord
  mount_uploader :bad_image, BadImageUploader
  mount_uploader :good_image, GoodImageUploader
  belongs_to :user
  has_one :bad_event, dependent: :destroy
  has_many :good_events, dependent: :destroy

  validates :bad_image, presence: true
  enum status: { bad: 0, good: 1 }

  def image_composite
    image_path = good_image.path
    image = MiniMagick::Image.open(image_path)
    image.resize "1050x1050"
    frame_path = Rails.root.join("app/assets/images/frame.png")
    frame = MiniMagick::Image.open(frame_path)
    frame.resize "1258x1577"
    result = frame.composite(image) do |c|
      c.compose "over"
      c.geometry "+60+220"
    end

    self.good_image = result
  end
end
