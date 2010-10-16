class CreateMedicalCertificates < ActiveRecord::Migration
  def self.up
    create_table :medical_certificates do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :medical_certificates
  end
end
