class CreateTimeSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :time_schedules do |t|
      t.references :event, foreign_key: true
      t.string :time
      t.string :content

      t.timestamps
    end
  end
end
