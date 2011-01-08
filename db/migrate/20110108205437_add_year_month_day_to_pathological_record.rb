class AddYearMonthDayToPathologicalRecord < ActiveRecord::Migration
  def self.up
    add_column :pathological_records, :day, :string
    add_column :pathological_records, :month, :string
    add_column :pathological_records, :year, :string
  end

  def self.down
    remove_column :pathological_records, :year
    remove_column :pathological_records, :month
    remove_column :pathological_records, :day
  end
end
