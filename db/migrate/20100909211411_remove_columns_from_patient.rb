class RemoveColumnsFromPatient < ActiveRecord::Migration
  def self.up
    remove_column :patients, :amount
  end

  def self.down
    add_column :patients, :amount, :decimal
  end
end
