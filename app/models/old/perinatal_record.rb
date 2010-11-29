module Old
  class PerinatalRecord < OldDB
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
    set_table_name "perinatal_records"
  end
end