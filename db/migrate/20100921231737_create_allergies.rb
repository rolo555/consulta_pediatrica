class CreateAllergies < ActiveRecord::Migration
  def self.up
    create_table :allergies do |t|
      t.string :substance
      t.string :reaction
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :allergies
  end
end
