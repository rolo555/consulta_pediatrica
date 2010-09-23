class CreateSurgicalRecords < ActiveRecord::Migration
  def self.up
    create_table :surgical_records do |t|
      t.integer :patient_id
      t.date :date
      t.string :pathology
      t.string :procedure

      t.timestamps
    end
  end

  def self.down
    drop_table :surgical_records
  end
end
