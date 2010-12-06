class CreateVaccineSales < ActiveRecord::Migration
  def self.up
    create_table :vaccine_sales do |t|
      t.integer :vaccine_id
      t.string :buyer
      t.integer :sales_units
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :vaccine_sales
  end
end
