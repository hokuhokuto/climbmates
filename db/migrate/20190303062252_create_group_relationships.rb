class CreateGroupRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :group_relationships do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.integer :approval, default: 0
      
      t.timestamps
    end
  end
end
