module Old
  class PathologicalRecord < OldDB
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
    set_table_name "pathological_records"
  end
end