class CreateHospitalizationFollowUps < ActiveRecord::Migration
  def self.up
    create_table :hospitalization_follow_ups do |t|
      t.integer :hospitalization_id
      t.datetime :date
      t.text :currentCondition
      t.text :physicalExamination
      t.text :diagnosis
      t.text :treatment
      t.string :room
      t.text :prescription

      t.timestamps
    end
  end

  def self.down
    drop_table :hospitalization_follow_ups
  end
end
