class CreateHospitalExpensesSurgeryQuotations < ActiveRecord::Migration
  def self.up
    create_table(:hospital_expenses_surgery_quotations, :id => false) do |t|
      t.integer :hospital_expense_id
      t.integer :surgery_quotation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hospital_expenses_surgery_quotations
  end
end
