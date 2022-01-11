class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :check
      t.string :introduction

      t.timestamps
    end
  end
end
