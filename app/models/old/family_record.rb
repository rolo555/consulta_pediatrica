module Old
  class FamilyRecord < OldDB
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
    set_table_name "family_records"

  end
end