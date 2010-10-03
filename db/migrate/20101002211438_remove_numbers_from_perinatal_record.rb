class RemoveNumbersFromPerinatalRecord < ActiveRecord::Migration
  def self.up
    remove_column :perinatal_records, :number_of_pregnancy
    remove_column :perinatal_records, :childbirth
    remove_column :perinatal_records, :cesarea
    remove_column :perinatal_records, :abortions
    remove_column :perinatal_records, :weeks_of_gestation
    remove_column :perinatal_records, :apgar1
    remove_column :perinatal_records, :apgar2
    remove_column :perinatal_records, :height
    remove_column :perinatal_records, :weight
    remove_column :perinatal_records, :head_circumference
    remove_column :perinatal_records, :body_perimeter
  end

  def self.down
    add_column :perinatal_records, :number_of_pregnancy, :number
    add_column :perinatal_records, :childbirth, :number
    add_column :perinatal_records, :cesarea, :number
    add_column :perinatal_records, :abortions, :number
    add_column :perinatal_records, :weeks_of_gestation, :number
    add_column :perinatal_records, :apgar1, :number
    add_column :perinatal_records, :apgar2, :number
    add_column :perinatal_records, :height, :float
    add_column :perinatal_records, :weight, :float
    add_column :perinatal_records, :head_circumference, :float
    add_column :perinatal_records, :body_perimeter, :float
  end
end
