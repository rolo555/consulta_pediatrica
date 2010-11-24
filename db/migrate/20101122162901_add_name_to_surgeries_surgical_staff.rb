class AddNameToSurgeriesSurgicalStaff < ActiveRecord::Migration
  def self.up
    add_column :surgeries_surgical_staffs, :name, :string
  end

  def self.down
    remove_column :surgeries_surgical_staffs, :name
  end
end
