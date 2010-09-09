class CreatePatientPrices < ActiveRecord::Migration
  def self.up
    create_table :patient_prices do |t|
      t.string :price_type
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_prices
  end
end
