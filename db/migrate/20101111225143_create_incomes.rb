class CreateIncomes < ActiveRecord::Migration
  def self.up
    create_table :incomes do |t|
      t.text :concept
      t.decimal :amount
      t.references :payment, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :incomes
  end
end
