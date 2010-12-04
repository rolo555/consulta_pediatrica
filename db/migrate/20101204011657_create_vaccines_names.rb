class CreateVaccinesNames < ActiveRecord::Migration
  def self.up
    create_table :vaccines_names do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :vaccines_names
  end
end
