class CreateVaccines < ActiveRecord::Migration
  def self.up
    create_table :vaccines do |t|
      t.integer :vaccines_name_id
      t.decimal :purchase_cost
      t.float :percentage_increase
      t.integer :units
      t.date :expiration_date

      t.timestamps
    end
  end

  def self.down
    drop_table :vaccines
  end
end
