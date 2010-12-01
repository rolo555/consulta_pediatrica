class CreateHospitalizations < ActiveRecord::Migration
  def self.up
    create_table :hospitalizations do |t|
      t.string :room
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hospitalizations
  end
end
