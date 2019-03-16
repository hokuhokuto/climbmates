class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  validates :comment, length: { maximum:255 }

  has_many :groups, dependent: :destroy
  
  has_many :events, dependent: :destroy
  
  has_many :group_relationships, dependent: :destroy
  has_many :join_groups, through: :group_relationships, source: :group
  
  mount_uploader :image, ImageUploader
  
  def apply_to(group)
    self.group_relationships.find_or_create_by(group_id: group.id)
  end
  
  def cancel_apply_to(group)
    group_relationship = self.group_relationships.find_by(group_id: group.id)
    group_relationship.destroy if group_relationship
  end
  
  def group_member?(group)
    self.group_relationships.include?(group.id)
  end
end