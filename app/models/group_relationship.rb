class GroupRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  enum approval: { pending: 0,approvaled: 1 }
end
