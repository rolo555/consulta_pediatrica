class AddColumnsToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :amount, :decimal
  end

  def self.down
    remove_column :patients, :amount
  end
end
