class CreateMedicalOrders < ActiveRecord::Migration
  def self.up
    create_table :medical_orders do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :medical_orders
  end
end
