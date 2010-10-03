class CreateLaboratoryProfiles < ActiveRecord::Migration
  def self.up
    create_table :laboratory_profiles do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :laboratory_profiles
  end
end
