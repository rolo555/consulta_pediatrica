class CreatePathologicalRecords < ActiveRecord::Migration
  def self.up
    create_table :pathological_records do |t|
      t.integer :patient_id
      t.date :date
      t.string :diagnosis
      t.string :treatment

      t.timestamps
    end
  end

  def self.down
    drop_table :pathological_records
  end
end
