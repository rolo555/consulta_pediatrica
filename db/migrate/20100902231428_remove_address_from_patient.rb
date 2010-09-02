class RemoveAddressFromPatient < ActiveRecord::Migration
  def self.up
    remove_column :patients, :address
  end

  def self.down
    add_column :patients, :address, :string
  end
end
