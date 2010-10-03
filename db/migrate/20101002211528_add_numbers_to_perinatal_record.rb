class AddNumbersToPerinatalRecord < ActiveRecord::Migration
  def self.up
    add_column :perinatal_records, :number_of_pregnancy, :string
    add_column :perinatal_records, :childbirth, :string
    add_column :perinatal_records, :cesarea, :string
    add_column :perinatal_records, :abortions, :string
    add_column :perinatal_records, :weeks_of_gestation, :string
    add_column :perinatal_records, :apgar1, :string
    add_column :perinatal_records, :apgar2, :string
    add_column :perinatal_records, :height, :string
    add_column :perinatal_records, :weight, :string
    add_column :perinatal_records, :head_circumference, :string
    add_column :perinatal_records, :body_perimeter, :string
  end

  def self.down
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
end
