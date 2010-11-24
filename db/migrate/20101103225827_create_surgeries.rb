class CreateSurgeries < ActiveRecord::Migration
  def self.up
    create_table :surgeries do |t|
      t.string :pre_operative_diagnosis
      t.string :post_operative_diagnosis
      t.text :procedure
      t.text :complications
      t.integer :total_amount
      t.integer :hospital_amount
      t.float :doctors_percentage
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :surgeries
  end
end