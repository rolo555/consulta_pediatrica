class CreateImmunizationRecords < ActiveRecord::Migration
  def self.up
    create_table :immunization_records do |t|
      t.integer :patient_id
      t.integer :vaccines_name_id

      t.timestamps
    end
  end

  def self.down
    drop_table :immunization_records
  end
end
