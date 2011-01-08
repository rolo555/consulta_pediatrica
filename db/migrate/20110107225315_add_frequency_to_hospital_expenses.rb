class AddFrequencyToHospitalExpenses < ActiveRecord::Migration
  def self.up
    add_column :hospital_expenses, :frequency, :string
  end

  def self.down
    remove_column :hospital_expenses, :frequency
  end
end
