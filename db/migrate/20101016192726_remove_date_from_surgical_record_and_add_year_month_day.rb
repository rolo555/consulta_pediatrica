class RemoveDateFromSurgicalRecordAndAddYearMonthDay < ActiveRecord::Migration
  def self.up
    remove_column :surgical_records, :date
    add_column :surgical_records, :year, :string
    add_column :surgical_records, :month, :string
    add_column :surgical_records, :day, :string
  end

  def self.down
    add_column :surgical_records, :date, :date
    remove_column :surgical_records, :year
    remove_column :surgical_records, :month
    remove_column :surgical_records, :day
  end
end
