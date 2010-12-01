module Old
  class SurgicalRecord < OldDB
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
    set_table_name "surgical_records"
  end
end