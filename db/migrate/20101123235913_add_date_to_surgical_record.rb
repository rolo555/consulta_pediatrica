class AddDateToSurgicalRecord < ActiveRecord::Migration
  def self.up
    add_column :surgical_records, :date, :date
  end

  def self.down
    remove_column :surgical_records, :date
  end
end
