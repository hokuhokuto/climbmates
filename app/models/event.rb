class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 255 }
  belongs_to :user
  belongs_to :group
  has_many :time_schedules, dependent: :destroy
end