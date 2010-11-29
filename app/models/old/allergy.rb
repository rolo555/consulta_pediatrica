module Old
  class Allergy < OldDB
    belongs_to :patient,
      :class_name => "Patient",
      :foreign_key => "patient_id"
  
    set_table_name "allergies"
  end
end