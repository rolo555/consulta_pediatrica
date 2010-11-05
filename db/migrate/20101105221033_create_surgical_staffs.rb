class CreateSurgicalStaffs < ActiveRecord::Migration
  def self.up
    create_table :surgical_staffs do |t|
      t.string :staff
      t.float :percentage
      t.boolean :is_always_present

      t.timestamps
    end
  end

  def self.down
    drop_table :surgical_staffs
  end
end
