class AddColumnsToConsultationPrices < ActiveRecord::Migration
  def self.up
    add_column :consultation_prices, :default, :boolean
  end

  def self.down
    remove_column :consultation_prices, :default
  end
end
