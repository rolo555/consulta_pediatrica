class RemovePhoneNumberFromPatient < ActiveRecord::Migration
  def self.up
    remove_column :patients, :phone_number
  end

  def self.down
    add_column :patients, :phone_number, :string
  end
end
