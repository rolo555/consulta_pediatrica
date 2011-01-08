class ChangeAmountsFromSurgeries < ActiveRecord::Migration
  def self.up
    remove_column :surgeries, :total_amount
    remove_column :surgeries, :hospital_amount
    add_column :surgeries, :total_amount, :decimal
    add_column :surgeries, :hospital_amount, :decimal
  end

  def self.down
    remove_column :surgeries, :total_amount
    remove_column :surgeries, :hospital_amount
    add_column :surgeries, :total_amount, :integer
    add_column :surgeries, :hospital_amount, :integer
  end
end
