class ChangeAmountFromConsultationPrices < ActiveRecord::Migration
  def self.up
    remove_column :consultation_prices, :amount
    add_column :consultation_prices, :amount, :decimal
  end

  def self.down
    remove_column :consultation_prices, :amount
    add_column :consultation_prices, :amount, :integer
  end
end
