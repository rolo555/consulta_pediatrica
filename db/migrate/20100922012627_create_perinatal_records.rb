class CreatePerinatalRecords < ActiveRecord::Migration
  def self.up
    create_table :perinatal_records do |t|
      t.integer :patient_id
      t.integer :number_of_pregnancy
      t.integer :childbirth
      t.integer :cesarea
      t.integer :abortions
      t.float :weight
      t.float :height
      t.float :head_circumference
      t.float :body_perimeter
      t.integer :weeks_of_gestation
      t.integer :apgar1
      t.integer :apgar2
      t.string :type_of_birth
      t.boolean :jaundice
      t.text :observations

      t.timestamps
    end
  end

  def self.down
    drop_table :perinatal_records
  end
end
