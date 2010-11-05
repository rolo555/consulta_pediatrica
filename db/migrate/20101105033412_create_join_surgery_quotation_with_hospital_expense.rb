class CreateJoinSurgeryQuotationWithHospitalExpense < ActiveRecord::Migration
  def self.up
    create_table :hospital_expenses_surgery_quotations do |t|
      t.integer :surgery_quotation_id
      t.integer :hospital_expense_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hospital_expenses_surgery_quotations
  end
end
