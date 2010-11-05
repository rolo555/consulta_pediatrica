class CreateDrugs < ActiveRecord::Migration
  def self.up
    create_table :drugs do |t|
      t.string :name
      t.integer :how_often_in_hours
      t.integer :how_often_in_wight
      t.text :recipe

      t.timestamps
    end
  end

  def self.down
    drop_table :drugs
  end
end
