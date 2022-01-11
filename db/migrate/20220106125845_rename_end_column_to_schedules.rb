class RenameEndColumnToSchedules < ActiveRecord::Migration[7.0]
  def change
    rename_column :schedules, :end, :end_day
  end
end
