class AddColumnToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :info, :string
  end
end
