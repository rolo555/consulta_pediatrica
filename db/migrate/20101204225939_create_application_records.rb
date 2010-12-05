class CreateApplicationRecords < ActiveRecord::Migration
  def self.up
    create_table :application_records do |t|
      t.integer :immunization_record_id
      t.date :date
      t.string :application_type

      t.timestamps
    end
  end

  def self.down
    drop_table :application_records
  end
end
