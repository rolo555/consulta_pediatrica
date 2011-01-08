class ChangePriceFromHospitalExpenses < ActiveRecord::Migration
  def self.up
    remove_column :hospital_expenses, :price
    add_column :hospital_expenses, :price, :decimal
  end

  def self.down
    remove_column :hospital_expenses, :price
    add_column :hospital_expenses, :price, :integer
  end
end
