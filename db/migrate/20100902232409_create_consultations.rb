class CreateConsultations < ActiveRecord::Migration
  def self.up
    create_table :consultations do |t|
      t.integer :patient_id
      t.float :weight
      t.float :height
      t.float :head_circumference
      t.float :anterior_fontanel
      t.float :temperature
      t.decimal :amount
      t.boolean :deduct_clinic_percentage
      t.text :current_condition
      t.text :diagnosis
      t.text :medical_certificate
      t.text :recipe
      t.text :order
      t.text :laboratory

      t.timestamps
    end
  end

  def self.down
    drop_table :consultations
  end
end
