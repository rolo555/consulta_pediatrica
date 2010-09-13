class CreateConsultationPrices < ActiveRecord::Migration
  def self.up
    create_table :consultation_prices do |t|
      t.string :price_type
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :consultation_prices
  end
end
