class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :info, presence: true, length: { maximum: 255 }
  
  belongs_to :user
  
  has_many :group_relationships, dependent: :destroy
  has_many :joined_users, through: :group_relationships, source: :user
  
  mount_uploader :image, ImageUploader
  

end
