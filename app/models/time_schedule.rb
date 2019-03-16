class TimeSchedule < ApplicationRecord
  validates :time, presence: true
  validates :content, presence: true, length: { maximum: 30 }
  belongs_to :event
end
