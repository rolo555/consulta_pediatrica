class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.text :concept
      t.date :reminder_date
      t.references :reminder, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :reminders
  end
end
