class ChangeAndAddColumnsToPatients < ActiveRecord::Migration
  def self.up
    remove_column :patients, :origin
    add_column :patients, :place_id, :integer
  end

  def self.down
    remove_columns :patients, :place_id
    add_column :patients, :origin, :string
  end
end