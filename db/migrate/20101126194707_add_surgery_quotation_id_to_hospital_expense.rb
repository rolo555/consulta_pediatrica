class AddSurgeryQuotationIdToHospitalExpense < ActiveRecord::Migration
  def self.up
    add_column :hospital_expenses, :surgery_quotation_id, :integer
  end

  def self.down
    remove_column :hospital_expenses, :surgery_quotation_id
  end
end
