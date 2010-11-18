class CreateBalances < ActiveRecord::Migration
  def self.up
    create_table :balances do |t|
      t.date :date_start
      t.date :date_finish

      t.timestamps
    end
  end

  def self.down
    drop_table :balances
  end
end
