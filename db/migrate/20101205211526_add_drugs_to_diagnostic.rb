class AddDrugsToDiagnostic < ActiveRecord::Migration
  def self.up
    create_table(:diagnostics_drugs, :id => false) do |t|
      t.integer :diagnostic_id
      t.integer :drug_id

      t.timestamps
    end
  end

  def self.down
    drop_table :diagnostics_drugs
  end
end
