class AddColumnsToPatien < ActiveRecord::Migration
  def self.up
    add_column :patients, :consultation_price_id, :integer
  end

  def self.down
    remove_column :patients, :consultation_price_id
  end
end
