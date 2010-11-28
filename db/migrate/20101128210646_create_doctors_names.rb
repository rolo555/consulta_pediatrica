class CreateDoctorsNames < ActiveRecord::Migration
  def self.up
    create_table :doctors_names do |t|
      t.string :name
      t.integer  :hospitalization_id

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors_names
  end
end
