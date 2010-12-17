class CreateVaccineSchedules < ActiveRecord::Migration
  def self.up
    create_table :vaccine_schedules do |t|
      t.integer :vaccines_name_id
      t.string :application_type
      t.integer :days

      t.timestamps
    end
  end

  def self.down
    drop_table :vaccine_schedules
  end
end
