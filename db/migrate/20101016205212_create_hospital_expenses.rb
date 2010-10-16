class CreateHospitalExpenses < ActiveRecord::Migration
  def self.up
    create_table :hospital_expenses do |t|
      t.string :concept
      t.integer :price
      t.boolean :is_always_used

      t.timestamps
    end
  end

  def self.down
    drop_table :hospital_expenses
  end
end
