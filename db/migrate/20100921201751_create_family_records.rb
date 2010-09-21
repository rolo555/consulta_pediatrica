class CreateFamilyRecords < ActiveRecord::Migration
  def self.up
    create_table :family_records do |t|
      t.string :pathology
      t.string :relation_ship
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :family_records
  end
end
