class CreateSurgeriesSurgicalStaffs < ActiveRecord::Migration
  def self.up
    create_table :surgeries_surgical_staffs do |t|
      t.integer :surgery_id
      t.integer :surgical_staff_id

      t.timestamps
    end
  end

  def self.down
    drop_table :surgeries_surgical_staffs
  end
end
