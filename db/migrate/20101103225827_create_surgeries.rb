class CreateSurgeries < ActiveRecord::Migration
  def self.up
    create_table :surgeries do |t|
      t.string :pre_operatiove_diagnosis
      t.string :post_operative_diagnosis
      t.string :sugeon
      t.string :assistant
      t.string :anesthesia_doctor
      t.text :procedure
      t.text :complicacions
      t.integer :total_amount
      t.integer :hospital_amount
      t.integer :surgion_amount
      t.integer :anesthesia_doctor_amount
      t.integer :assistant_amount
      t.integer :istrumentalist
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :surgeries
  end
end
