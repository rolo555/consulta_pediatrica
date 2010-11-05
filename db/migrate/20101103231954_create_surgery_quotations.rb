class CreateSurgeryQuotations < ActiveRecord::Migration
  def self.up
    create_table :surgery_quotations do |t|
      t.integer :days_of_hospitalization
      t.string :surgery_time
      t.decimal :medical_expenses
      t.integer :consultation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :surgery_quotations
  end
end
