class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      # I use two fields instead one datetime to can group hours (start_time) by date (start_date) on another future form
      t.date :start_on
      t.time :start_time

      t.timestamps
    end

    add_index :schedules, :start_on # Needed when request all start_time grouped by start_on
    add_index :schedules, [:start_on, :start_time], unique: true # Schedule should be uniq by this fields
  end
end
