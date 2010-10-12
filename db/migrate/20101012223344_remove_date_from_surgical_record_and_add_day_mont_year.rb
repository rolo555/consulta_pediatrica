class RemoveDateFromSurgicalRecordAndAddDayMontYear < ActiveRecord::Migration
  def self.up
    remove_column :surgical_records, :date
    add_column :surgical_records, :day, :integer
    add_column :surgical_records, :month, :integer
    add_column :surgical_records, :year, :integer
  end

  def self.down
    add_column :surgical_records, :date, :date
    remove_column :surgical_records, :day
    remove_column :surgical_records, :month
    remove_column :surgical_records, :year
  end
end
